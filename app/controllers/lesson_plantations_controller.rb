class LessonPlantationsController < ApplicationController
  before_filter :authorize, :except => [:new, :show]

  # GET /lesson_plantations
  def index
    @lesson_plantations = LessonPlantation.all
  end

  # GET /lesson_plantations/1
  def show
    @lesson_plantation = LessonPlantation.find(params[:id])
    @farmings = @lesson_plantation.farmings
    #@knowledges = @lesson_plantation.knowledges
  end

  # GET /lesson_plantations/new
  def new
    if current_user
      @lesson_plantation = LessonPlantation.new
      @user = current_user
      @knowledge = @lesson_plantation.knowledges.build
      @farming = @knowledge.farmings.build
    else
      p params
      p "00000000000000"
      @user = User.new
      render "/users/new", :layout => "bare"
    end
  end

  # GET /lesson_plantations/1/edit
  def edit
    @lesson_plantation = LessonPlantation.find(params[:id])
    @user = @lesson_plantation.user
  end

  # POST /lesson_plantations
  def create
    # make hash for each farming and add to array
    array_of_farming_hashes = [] # array of info for knowledges and farmings
    i = 0
    params[:lesson_plantation][:knowledges_attributes].each do |knowledge_hash|
      if knowledge_hash.last[:url] != "" && knowledge_hash.last[:farmings_attributes].first.last[:title] != ""
        farming_hash = {}
        # add url to hash
        farming_hash[:url] = knowledge_hash.last[:url]
        # add farmings to hash
        farming_hash[:title] = knowledge_hash.last[:farmings_attributes].first.last[:title]
        farming_hash[:notes] = knowledge_hash.last[:farmings_attributes].first.last[:notes]
        # put the hash for the knowledge into an array
        array_of_farming_hashes[i] = farming_hash
        i += 1
      end
    end

    array_of_farming_hashes.each do |knowledge_hash|
      knowledge_inputs = {}
      knowledge_object = KnowledgeScraper.new(knowledge_hash[:url])
      knowledge_url = knowledge_hash[:url]

      if knowledge_object.bad_url && (knowledge_url =~ URI::regexp).nil?
        # if URL doesnt scrape and doesnt look like URL
        knowledge_inputs[:knowledge_string_id] = knowledge_url
        knowledge_inputs[:title] = knowledge_url
        knowledge_inputs[:description] = knowledge_url
        
      else # if either scrapes or looks like URL or both
        # get rid of http(s)
        knowledge_url_no_http = knowledge_url.gsub("https://","").chomp(separator="/")
        knowledge_url_no_http = knowledge_url.gsub("http://","").chomp(separator="/")

        knowledge_inputs[:knowledge_string_id] = knowledge_url_no_http
        knowledge_inputs[:title] = knowledge_object.title.blank? ? knowledge_inputs[:knowledge_string_id] : knowledge_object.title.strip
        knowledge_inputs[:description] = knowledge_object.description.blank? ? knowledge_inputs[:title] : knowledge_object.description
      end

      knowledge_search_results = Knowledge.where("string_id LIKE ?", "%#{knowledge_inputs[:knowledge_string_id]}%")
      # search for knowledge_string_id
      if knowledge_search_results.empty?
        #return new knowlege if not already in database
        knowledge = Knowledge.new(:title => knowledge_inputs[:title], :url => knowledge_url, :description => knowledge_inputs[:description], :string_id => knowledge_inputs[:knowledge_string_id])
        knowledge.save
      else
        #set the knowledge to be the knowledge that already exists
        knowledge = knowledge_search_results.first
      end
      
      # add the knowledges ID to an array to create the Farming
      knowledge_hash[:knowledge_id] = knowledge.id

    end # end going through each knowledge_url

    @lesson_plantation = LessonPlantation.new(params[:lesson_plantation])
  
    if @lesson_plantation.save #save the lesson_plantation and farmings
      # create the farmings (instead of set the collection to include the knowledge -> @lesson_plantation.knowledges<<knowledges_array)
      array_of_farming_hashes.each do |farming_inputs_hash|
        @farming = Farming.new(:lesson_plantation_id => @lesson_plantation.id, :knowledge_id => farming_inputs_hash[:knowledge_id], :title => farming_inputs_hash[:title], :notes => farming_inputs_hash[:notes])
        @farming.save
      end
    else
      render action: "new"
    end
    redirect_to @lesson_plantation
  end

  # PUT /lesson_plantations/1
  def update
    @lesson_plantation = LessonPlantation.find(params[:id])

    p params

    if @lesson_plantation.update_attributes(params[:lesson_plantation])
      params[:lesson_plantation][:knowledges_attributes].each do |knowledge_hash|
        farming_params = {}
        farming_params = knowledge_hash.last[:farmings_attributes].first.last

        if farming_params[:destroy] == "1" # if removed the farming, then just destroy it
          p farming_params[:destroy]
          p "000000000"
          Farming.find(farming_params[:id]).destroy if farming_params[:id]
        elsif farming_params[:id].nil? # if the farming doesnt exist yet, check if knowledge exists, create farming
          p farming_params[:destroy]
          p "111111111"
          if knowledge_hash.last[:url] != ""  # if the knowledge_hash has a URL
            farming_hash = {}
            # add url to hash
            farming_hash[:url] = knowledge_hash.last[:url]
            # add farmings to hash
            farming_hash[:title] = knowledge_hash.last[:farmings_attributes].first.last[:title]
            farming_hash[:notes] = knowledge_hash.last[:farmings_attributes].first.last[:notes]

            knowledge_inputs = {}
            knowledge_object = KnowledgeScraper.new(farming_hash[:url])
            knowledge_url = farming_hash[:url]

            if knowledge_object.bad_url && (knowledge_url =~ URI::regexp).nil?
              # if URL doesnt scrape and doesnt look like URL
              knowledge_inputs[:knowledge_string_id] = knowledge_url
              knowledge_inputs[:title] = knowledge_url
              knowledge_inputs[:description] = knowledge_url

            else # if either scrapes or looks like URL or both
              # get rid of http(s)
              knowledge_url_no_http = knowledge_url.gsub("https://","").chomp(separator="/")
              knowledge_url_no_http = knowledge_url.gsub("http://","").chomp(separator="/")

              knowledge_inputs[:knowledge_string_id] = knowledge_url_no_http
              knowledge_inputs[:title] = knowledge_object.title.blank? ? knowledge_inputs[:knowledge_string_id] : knowledge_object.title.strip
              knowledge_inputs[:description] = knowledge_object.description.blank? ? knowledge_inputs[:title] : knowledge_object.description
            end

            knowledge_search_results = Knowledge.where("string_id LIKE ?", "%#{knowledge_inputs[:knowledge_string_id]}%")
            # search for knowledge_string_id
            if knowledge_search_results.empty?
              #return new knowlege if not already in database
              knowledge = Knowledge.new(:title => knowledge_inputs[:title], :url => knowledge_url, :description => knowledge_inputs[:description], :string_id => knowledge_inputs[:knowledge_string_id])
              knowledge.save
            else
              #set the knowledge to be the knowledge that already exists
              knowledge = knowledge_search_results.first
            end

            @farming = Farming.new(:lesson_plantation_id => @lesson_plantation.id, :knowledge_id => knowledge.id, :title => farming_hash[:title], :notes => farming_hash[:notes])
            @farming.save

          end # end of if for farming doesnt exist

        else #the farming already exists, so just update
          p farming_params[:destroy]
          p "2222222222"
          
          farming = Farming.find(farming_params[:id])
          farming_params.delete(:destroy)
          farming.update_attributes(farming_params)
        end

      end
      redirect_to @lesson_plantation, notice: 'Lesson plantation was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /lesson_plantations/1
  def destroy
    @lesson_plantation = LessonPlantation.find(params[:id])
    @lesson_plantation.destroy

    respond_to do |format|
      format.html { redirect_to lesson_plantations_url }
      format.json { head :ok }
    end
  end
end
