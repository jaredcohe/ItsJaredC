class KnowledgesController < ApplicationController

  # to access private methods at bottom
  helper_method :sort_column, :sort_direction

  def index
    @knowledges = Knowledge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @knowledges }
    end
  end

  def show
    @knowledge = Knowledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @knowledge }
    end
  end

  def new
    p# params[:knowledge]
    @knowledge = Knowledge.new
    @knowledge.providers.build
    5.times { @knowledge.categorizations.build }
    p params

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @knowledge }
    end
  end

  # GET /knowledges/1/edit
  def edit
    @knowledge = Knowledge.find(params[:id])
    @provider_url = @knowledge.url[/.+\.[A-Za-z0-9]{2,4}\//].nil? ? @knowledge.url : @knowledge.url[/.+\.[A-Za-z0-9]{2,4}\//]
    @knowledge.providers.build(:url => @provider_url) if @knowledge.providers.empty?
    @knowledge.providers.build
    3.times { @knowledge.categorizations.build }
    #@knowledge.categorizations.build if @knowledge.categories.empty?

    #(1..(10 - @knowledge.tags.count)).each { @knowledge.tags.build }
    p "knowledges controller, edit path"
    p params
    p "8888888888888888888888"
  end

  def knowledge_from_url
    @knowledge = Knowledge.new(params[:knowledge])
    redirect_to new_knowledge_path(@knowledge)
  end

  # POST /knowledges
  # POST /knowledges.json
  def create
    p 'create'
    p params
    p params[:knowledge]
    @knowledge = Knowledge.new(params[:knowledge])
    p '@knowledge in create is'
    p @knowledge
    #p @knowledge.providers
    #p @knowledge.tags
    p "knowledges controller, create path"
    p params
    p "8888888888888888888888"
    
    respond_to do |format|
      if @knowledge.save
        format.html { redirect_to @knowledge, notice: 'Knowledge was successfully created.' }
        format.json { render json: @knowledge, status: :created, location: @knowledge }
      else
        format.html { render action: "new" }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /knowledges/1
  # PUT /knowledges/1.json
  def update
    @knowledge = Knowledge.find(params[:id])
    @knowledge.user_id = current_user ? current_user.id : '1'

    p "knowledges controller, update path"
    p params
    p "77777777777777777777"
    p @knowledge

    respond_to do |format|
      if @knowledge.update_attributes(params[:knowledge])
        format.html { redirect_to @knowledge, notice: 'Knowledge was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledges/1
  # DELETE /knowledges/1.json
  def destroy
    @knowledge = Knowledge.find(params[:id])
    @knowledge.destroy

    respond_to do |format|
      format.html { redirect_to knowledges_url }
      format.json { head :ok }
    end
  end

  def knowledges_providers
    @knowledges = Knowledge.order(sort_column + " " + sort_direction)
    p "000000XXXXXXXXXX"
    render "knowledges_providers"
  end

  private

  def sort_column
    Knowledge.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
