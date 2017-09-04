class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< 7543c925bb722c641a63a2acefc51aaa92593073
  private
    def current_user
      @current_user ||= session[:adminname] && Admin.find(1)
=======
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
>>>>>>> b3
    end

    helper_method :current_user
end
