class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :require_login, only: [:edit, :show, :update, :destroy]


  def new   
      if session[:user_id]
        redirect_to "/users/#{session[:user_id]}"
      end
  end
    
  def require_login
      redirect_to "/sessions/new" unless session[:user_id]
  end


 def create
   puts "\n\n\n\n\nvvv\n\n\n\n"
   puts params.inspect
      puts "\n\n\n\n\n^^^\n\n\n\n"  
    @user = User.find_by_email(login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else 
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/sessions/new"
    end
  end

  def destroy
    reset_session
    redirect_to "/sessions/new"
  end

private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end