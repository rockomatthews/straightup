class ChallengesController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :require_correct_user, only: [:edit, :show, :update, :destroy]

    def new
        @users = User.all
    end

    def index
        
    end
        
    def show
        
    end
    
    def edit
    end
    
    def create
        @user = User.all
        @challenge = Challenge.new challenge_params
            redirect_to "/challenges"
    end
    
    def destroy
    end


    private

        def require_correct_user
            if current_user != User.find(params[:id])
                redirect_to "/users/#{session[:user_id]}"
            end
        end

        def challenge_params
        params.require(:challenge).permit(:event, :rules, :bet_amount, :challenge_accepted?, :challenge_complete?, :user1_id, :user2_id, :moderator_id)
        end

end