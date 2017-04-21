class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_sessions

  private
  def check_sessions
      if !session[:user_id]
          redirect_to '/'
      end
  end
end
