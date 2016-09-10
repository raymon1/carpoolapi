class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :join, :leave]

  # GET /trips
  # GET /trips.json
  def index
    user = User.find_by_id(params[:user_id])
    colleagues = user.group.users.ids
    @trips = Trip.where(source: user.home_place, destination: user.work_place, driver: colleagues)
    @trips = @trips.where('departure_time > ? and seat > 0', DateTime.now)
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /trips/Y/join
  # params[:user_id]
  def join
    @trip_join = TripJoin.new(trip_id: @trip.id, user_id: params[:user_id])
    respond_to do |format|
      if @trip_join.save
        format.html { redirect_to @trip, notice: 'Trip was successfully joined.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /trips/Y/leave
  # params[:user_id]
  def leave
    @trip_join = TripJoin.where(trip_id: @trip.id, user_id: params[:user_id]).first
    @trip_join.destroy
    respond_to do |format|
      format.html { redirect_to @trip, notice: 'Trip was successfully left.' }
      format.json { render :show, status: :ok, location: @trip }
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip join was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.where(id: params[:id], driver_id: params[:user_id]).first
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:driver_id, :source_id, :destination_id, :departure_time, :seats)
    end
end
