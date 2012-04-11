class UserKnowledgeStatesController < ApplicationController
  before_filter :authorize
  # GET /user_knowledge_states
  # GET /user_knowledge_states.json
  def index
    @user_knowledge_states = UserKnowledgeState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_knowledge_states }
    end
  end

  # GET /user_knowledge_states/1
  # GET /user_knowledge_states/1.json
  def show
    @user_knowledge_state = UserKnowledgeState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_knowledge_state }
    end
  end

  # GET /user_knowledge_states/new
  # GET /user_knowledge_states/new.json
  def new
    @user_knowledge_state = UserKnowledgeState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_knowledge_state }
    end
  end

  # GET /user_knowledge_states/1/edit
  def edit
    @user_knowledge_state = UserKnowledgeState.find(params[:id])
  end

  # POST /user_knowledge_states
  # POST /user_knowledge_states.json
  def create
    @user_knowledge_state = UserKnowledgeState.new(params[:user_knowledge_state])

    respond_to do |format|
      if @user_knowledge_state.save
        format.html { redirect_to @user_knowledge_state, notice: 'User knowledge state was successfully created.' }
        format.json { render json: @user_knowledge_state, status: :created, location: @user_knowledge_state }
      else
        format.html { render action: "new" }
        format.json { render json: @user_knowledge_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_knowledge_states/1
  # PUT /user_knowledge_states/1.json
  def update
    @user_knowledge_state = UserKnowledgeState.find(params[:id])

    respond_to do |format|
      if @user_knowledge_state.update_attributes(params[:user_knowledge_state])
        format.html { redirect_to @user_knowledge_state, notice: 'User knowledge state was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_knowledge_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_knowledge_states/1
  # DELETE /user_knowledge_states/1.json
  def destroy
    @user_knowledge_state = UserKnowledgeState.find(params[:id])
    @user_knowledge_state.destroy

    respond_to do |format|
      format.html { redirect_to user_knowledge_states_url }
      format.json { head :ok }
    end
  end
end
