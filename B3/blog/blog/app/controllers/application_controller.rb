class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
    def current_user
      @current_user ||= session[:adminname] && Admin.find(1)
    end

    helper_method :current_user
end
