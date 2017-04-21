class SessionsController < ApplicationController

    before_action :check_sessions, except: [:index, :register, :login]
    def index
        render layout: "two_columns"
    end

    def register
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user[:id]
            redirect_to "/bright_ideas"
        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/"
        end
    end

    def login
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user[:id]
            redirect_to "/bright_ideas"
        else
            flash[:login_errors] = ["User credentials are wrong"]
            redirect_to '/'
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to '/'
    end
    private

    def user_params
        params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end
