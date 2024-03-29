class KnowledgesController < ApplicationController
  before_filter :authorize, :except => [:home, :show]

  # application layout is still default layout file

  # to access private methods at bottom
  helper_method :sort_column, :sort_direction

  def home
    @user_id = current_user.nil? ? "0" : current_user.id
    @knowledges = Knowledge.search(params[:search]).paginate(:per_page => 100, :page => params[:page])
    @lesson_plans = LessonPlantation.search(params[:search]).paginate(:per_page => 100, :page => params[:page])
    # render :home, :layout => "public"
  end

  def index
    @knowledges = Knowledge.all
  end

  def show
    @knowledge = Knowledge.find(params[:id])
    @user = current_user if current_user else nil
    #@user_knowledge_states = @knowledge.user_knowledge_states.build(:user_id => @user.id) if @user
  end

  def new
    @knowledge = Knowledge.new
    @knowledge.providers.build
    5.times { @knowledge.categorizations.build }
  end

  # GET /knowledges/1/edit
  def edit
    @knowledge = Knowledge.find(params[:id])
    @provider_url = @knowledge.url[/.+\.[A-Za-z0-9]{2,4}\//].nil? ? @knowledge.url : @knowledge.url[/.+\.[A-Za-z0-9]{2,4}\//]
    @knowledge.providers.build(:url => @provider_url) if @knowledge.providers.empty?
    @knowledge.providers.build
    3.times { @knowledge.categorizations.build }
  end

  def knowledge_from_url
    @knowledge = Knowledge.new(params[:knowledge])
    redirect_to new_knowledge_path(@knowledge)
  end

  # POST /knowledges
  def create
    @knowledge = Knowledge.new(params[:knowledge])

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
  def update
    @knowledge = Knowledge.find(params[:id])
    @knowledge.user_id = current_user ? current_user.id : '1'

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
  def destroy
    @knowledge = Knowledge.find(params[:id])
    @knowledge.destroy

    respond_to do |format|
      format.html { redirect_to knowledges_url }
      format.json { head :ok }
    end
  end

  def knowledges_providers
    @knowledges = Knowledge.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
  end

  private

  def sort_column
    Knowledge.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
