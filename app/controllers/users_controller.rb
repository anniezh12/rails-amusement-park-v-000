class UsersController < ApplicationController

   def index
     @users = User.all
   end

   def new
    @user = User.new
   end

   def create

    if params[:user][:name] =="" || params[:user][:nausea] =="" ||  params[:user][:happiness] == "" || params[:user][:tickets] =="" || params[:user][:height] =="" || params[:user][:password] ==""
      flash[:message] = "Plese fill in all the fields"
      redirect_to "/users/new"
    end
    @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
           redirect_to user_path(@user)
          else
            render :new
         end
  end

  def show
    redirect_to root_path if !logged_in?
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end


  private

  def user_params
      params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password,:admin)
  end

end
