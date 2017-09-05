class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

    def require_login
      if session[:admin] == false
        redirect_to '/admin/login'
      end
    end

    def current_user
      puts '111'
      @current_user ||= session[:adminname] && Admin.find_by(adminname: session[:adminname])
    end

    helper_method :current_user
end
