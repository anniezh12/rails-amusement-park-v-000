class RidesController < ApplicationController


  def new
  end

  def create
    @ride = Ride.new(ride_params)
    @user = User.find(@ride.user_id)
    @attraction = Attraction.find(@ride.attraction_id)
    @ride_status = @ride.take_ride
    flash[:message] = @ride_status
    redirect_to user_path(@user)
  end

private

def ride_params

  params.require(:ride).permit(:user_id, :attraction_id)

end
end
