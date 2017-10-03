class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_correct_user, only: [:edit, :show, :update, :destroy]
    
  def new
    @users = User.all
  end

  def show
    @user = User.includes(:wallet).find_by_id(params[:id])
    @users = User.all
  end

  def edit
  end

  def create
    @user = User.create user_params 
    @wallet = Wallet.new
    @wallet.save
    @user.wallet_id = @wallet.id
    @wallet.user = @user
    if @user.save && @wallet.save
      session[:user_id] = @user.id
      
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages + @wallet.errors.full_messages
      redirect_to "/sessions/new"
    end


  
  # def add_friend
  #   if current_user.friend_request(@friend)
  #     redirect_to my_friends_path, notice: "Friend request successfully sent."
  #   else
  #     redirect_to my_friends_path, flash[:error] = "There was an error sending the friend request"
  #   end
  # end

  # def accept_friend
  #   if current_user.accept_request(@friend)
  #     redirect_to my_friends_path, notice: "Friend request successfully accepted."
  #   else
  #     redirect_to my_friends_path, flash[:error] = "There was an error accepting the friend request."
  #   end
  # end
  
  end

  private
    def require_correct_user
      logger.debug "params[:id]: #{params[:id]}, session[:user_id]: #{session[:user_id]}" 
      if current_user != User.find(params[:id])
        redirect_to "/users/#{session[:user_id]}"
      end
    end


    def user_params
      params.require(:user).permit(:username, :email, :motto, :first_name, :last_name, :password, :password_confirmation)
    end

end
