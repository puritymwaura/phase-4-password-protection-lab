class UsersController < ApplicationController
    def create 
        user = User.craete(user_params);
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.error.full_messages }, status: :unprocessable_enity
        end
    end

    def show
        user =user.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    private
    def user_paramsparams.permit(:username, :password, :password_confirmation)
    end
end





