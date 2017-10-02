class SessionsController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create

     @user = User.find_by(name: params[:user][:name])
      if params[:user][:name] == "" || params[:user][:password] ==""
        flash[:message] = "Please fill in all the fields"
        redirect_to '/sessions/new'
      elsif @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end

   end

   def destroy
     session[:user_id] = nil
     redirect_to root_path
   end
end
