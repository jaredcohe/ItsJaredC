class KnowledgesController < ApplicationController
  # GET /knowledges
  # GET /knowledges.json
  def index
    @knowledges = Knowledge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @knowledges }
    end
  end

  # GET /knowledges/1
  # GET /knowledges/1.json
  def show
    @knowledge = Knowledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @knowledge }
    end
  end

  # GET /knowledges/new
  # GET /knowledges/new.json
  def new

    p 'new'
    p '2222222222'
    p params
    p params[:knowledge]
    p '333444444444'
    @knowledge = Knowledge.new
    2.times { @knowledge.providers.build }
    p params[:knowledge]
    p @knowledge
    p @knowledge.providers
    p '2222222222222'
    p 'knowledge#new parameters'
    p params

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @knowledge }
    end
  end

  # GET /knowledges/1/edit
  def edit
    @knowledge = Knowledge.find(params[:id])
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
    p '2222222222'
    p params
    
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
end
