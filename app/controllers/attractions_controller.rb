class AttractionsController < ApplicationController


  def index
        @attractions = Attraction.all
        @user = user.find_by(id: session[:user_id]) if session[:user_id]
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find_by(params[:id])
  end

  def update
      @attraction = Attraction.find_by(params[:id])
      @attraction.update(attraction_params)
      @attraction.save
      redirect_to @attraction
  end

  def create
      if params[:attraction][:name] =="" || params[:attraction][:nausea] =="" ||  params[:attraction][:happiness] == "" || params[:attraction][:tickets] =="" || params[:attraction][:height] ==""
        flash[:message] = "Plese fill
      in all the fields"
      redirect_to "/attractions/new"
    else
      @attraction = attraction.new(attraction_params)
        if @attraction.save
            redirect_to attractions_path(@attraction)
        end
    end
end

  def show

    @user = User.find(params[:id])
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end
  private

  def attraction_params
      params.require(:attraction).permit(:name, :nausea_rating,:happiness_rating,:tickets,:min_height )
  end
    end
