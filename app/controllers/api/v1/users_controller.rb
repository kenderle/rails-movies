class Api::V1::UsersController < ApplicationController

    skip_before_action :authenticate, only: [:login, :create]

    def login

    end

    def create
    
    end

    def logout

    end

    def me

    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation)
    end
end
