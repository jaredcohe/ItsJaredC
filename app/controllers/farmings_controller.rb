class FarmingsController < ApplicationController
  before_filter :authorize
  # GET /farmings
  # GET /farmings.json
  def index
    @farmings = Farming.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farmings }
    end
  end

  # GET /farmings/1
  # GET /farmings/1.json
  def show
    @farming = Farming.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @farming }
    end
  end

  # GET /farmings/new
  # GET /farmings/new.json
  def new
    @farming = Farming.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @farming }
    end
  end

  # GET /farmings/1/edit
  def edit
    @farming = Farming.find(params[:id])
  end

  # POST /farmings
  # POST /farmings.json
  def create
    @farming = Farming.new(params[:farming])

    respond_to do |format|
      if @farming.save
        format.html { redirect_to @farming, notice: 'Farming was successfully created.' }
        format.json { render json: @farming, status: :created, location: @farming }
      else
        format.html { render action: "new" }
        format.json { render json: @farming.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /farmings/1
  # PUT /farmings/1.json
  def update
    @farming = Farming.find(params[:id])

    respond_to do |format|
      if @farming.update_attributes(params[:farming])
        format.html { redirect_to @farming, notice: 'Farming was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @farming.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmings/1
  # DELETE /farmings/1.json
  def destroy
    @farming = Farming.find(params[:id])
    @farming.destroy

    respond_to do |format|
      format.html { redirect_to farmings_url }
      format.json { head :ok }
    end
  end
end
