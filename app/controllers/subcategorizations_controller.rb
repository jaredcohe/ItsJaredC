class SubcategorizationsController < ApplicationController
  # GET /subcategorizations
  # GET /subcategorizations.json
  def index
    @subcategorizations = Subcategorization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subcategorizations }
    end
  end

  # GET /subcategorizations/1
  # GET /subcategorizations/1.json
  def show
    @subcategorization = Subcategorization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcategorization }
    end
  end

  # GET /subcategorizations/new
  # GET /subcategorizations/new.json
  def new
    @subcategorization = Subcategorization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcategorization }
    end
  end

  # GET /subcategorizations/1/edit
  def edit
    @subcategorization = Subcategorization.find(params[:id])
  end

  # POST /subcategorizations
  # POST /subcategorizations.json
  def create
    @subcategorization = Subcategorization.new(params[:subcategorization])

    respond_to do |format|
      if @subcategorization.save
        format.html { redirect_to @subcategorization, notice: 'Subcategorization was successfully created.' }
        format.json { render json: @subcategorization, status: :created, location: @subcategorization }
      else
        format.html { render action: "new" }
        format.json { render json: @subcategorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subcategorizations/1
  # PUT /subcategorizations/1.json
  def update
    @subcategorization = Subcategorization.find(params[:id])

    respond_to do |format|
      if @subcategorization.update_attributes(params[:subcategorization])
        format.html { redirect_to @subcategorization, notice: 'Subcategorization was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcategorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategorizations/1
  # DELETE /subcategorizations/1.json
  def destroy
    @subcategorization = Subcategorization.find(params[:id])
    @subcategorization.destroy

    respond_to do |format|
      format.html { redirect_to subcategorizations_url }
      format.json { head :ok }
    end
  end
end
