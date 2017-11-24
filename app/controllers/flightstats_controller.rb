class FlightstatsController < ApplicationController
  before_action :set_flightstat, only: [:show, :edit, :update, :destroy]

  # GET /flightstats
  # GET /flightstats.json
  def index
    @flightstats = Flightstat.all
  end

  # GET /flightstats/1
  # GET /flightstats/1.json
  def show
  end

  # GET /flightstats/new
  def new
    @flightstat = Flightstat.new
  end

  # GET /flightstats/1/edit
  def edit
  end

  # POST /flightstats
  # POST /flightstats.json
  def create
    @flightstat = Flightstat.new(flightstat_params)

    respond_to do |format|
      if @flightstat.save
        format.html { redirect_to @flightstat, notice: 'Flightstat was successfully created.' }
        format.json { render :show, status: :created, location: @flightstat }
      else
        format.html { render :new }
        format.json { render json: @flightstat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flightstats/1
  # PATCH/PUT /flightstats/1.json
  def update
    respond_to do |format|
      if @flightstat.update(flightstat_params)
        format.html { redirect_to @flightstat, notice: 'Flightstat was successfully updated.' }
        format.json { render :show, status: :ok, location: @flightstat }
      else
        format.html { render :edit }
        format.json { render json: @flightstat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flightstats/1
  # DELETE /flightstats/1.json
  def destroy
    @flightstat.destroy
    respond_to do |format|
      format.html { redirect_to flightstats_url, notice: 'Flightstat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flightstat
      @flightstat = Flightstat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flightstat_params
      params.require(:flightstat).permit(:Month, :Value)
    end
end
