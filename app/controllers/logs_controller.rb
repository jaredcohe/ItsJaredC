class LogsController < ApplicationController
  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all

  end

  # GET /logs/1
  def show
    @log = Log.find(params[:id])
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
    @log = Log.find(params[:id])
  end

  # POST /logs
  def create
    p params
    p "=============="

    @log = Log.new(params[:log])

    if @log.save
      redirect_to @log, notice: 'Log was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /logs/1
  def update
    @log = Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to logs_url
  end
end
