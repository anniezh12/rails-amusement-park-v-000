class SessionsController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create

      if params[:user][:name] == "" || params[:user][:password] ==""
        flash[:message] = "Please fill in all the fields"
        redirect_to '/sessions/new'
      end
      @user = User.find_by(name: params[:user][:name])
      #binding.pry
              if @user == @user.authenticate(params[:user][:password])

                    session[:user_id] = @user.id
                    redirect_to user_path(@user)
                  else
                    flash[:message] = "user Not found"
                    redirect_to "/sessions/new"
              end


   end

   def destroy
     session[:user_id] = nil
     redirect_to root_path
   end
end
