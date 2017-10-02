class RidesController < ApplicationController


  def new
  end

  def create
    @ride = Ride.new(ride_params)
    if @ride
      @ride = @ride.take_ride
      @attraction = Attraction.find(@ride.attraction_id)
      redirect_to user_path(@user)
    end
  end

private

def ride_params

  params.require(:ride).permit(:user_id, :attraction_id)

end
end
