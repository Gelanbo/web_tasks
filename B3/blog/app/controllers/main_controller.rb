class MainController < ApplicationController
  skip_before_action :require_login,only: [:welcome]

  def welcome
    session[:admin] = false
    session[:adminname] = 'visitor'
    session[:lock_time] = Time.now - 1.day
    session[:login_times] = 0
  end

end
