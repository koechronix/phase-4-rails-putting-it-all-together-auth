class UsersController < ApplicationController

    def create
        # create a SIGNUP request
        user = User.create(user_params);
        if user.valid? 
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        # if user is authenticated return user object(autologin)
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
          else
            render json: { error: "Not authorized" }, status: :unauthorized
          end
    end


    private 

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
end
