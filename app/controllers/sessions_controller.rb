class SessionsController < ApplicationController

    def create
        # responds to POST login request
        user = User.find_by(username: params[:username]);
        # checks if user exists and is authenticated
        if user&.authenticate(params[:password])
            # creates a new session saving user id as session id
            session[:user_id] = user.id 
            render json: user, status: :created
        else
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def destroy
        # responds LOGOUT request
        user = User.find_by(id: session[:user_id])
        if user
            session.delete :user_id
        head :no_content
        else
            render json: {errors: ["Not authorized"]}, status: :unauthorized
        end
    end
end
