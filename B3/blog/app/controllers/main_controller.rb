class MainController < ApplicationController
<<<<<<< 7543c925bb722c641a63a2acefc51aaa92593073

  def welcome
    session[:admin] = false
=======
  skip_before_action :require_login,only: [:welcome]

  def welcome
    session[:admin] = false
    session[:adminname] = 'visitor'
>>>>>>> b3
    session[:lock_time] = Time.now - 1.day
    session[:login_times] = 0
  end

<<<<<<< 7543c925bb722c641a63a2acefc51aaa92593073
  def login
  end

  def start_login
    if Time.now - 10.minute >= session[:lock_time]
      if session[:login_times] == 3
        session[:login_times] == 0
        session[:lock_time] = Time.now - 1.day
      end
      #@admin = Admin.new
      @admin = Admin.find(1)
      @admin.adminname = "gelanbo"
      @admin.password = "123456"
      @admin.save
      if params[:adminname] == @admin.adminname && params[:password] == @admin.password
        session[:adminname] = @admin.adminname
        session[:admin] = true
        redirect_to '/index'
      else
        session[:login_times] = session[:login_times] + 1
        if session[:login_times] == 3
          session[:lock_time] = Time.now
          redirect_to '/fail_sleep'
        else
          redirect_to '/fail'
        end
      end
    else
      redirect_to '/fail_sleep'
    end
  end

  def fail_sleep
  end

  def fail
    @result = "登录失败！"
  end

  def index
    if session[:admin] == true
      @result="登陆成功"
    else
      redirect_to '/login'
    end
  end

  def getoff
    session[:admin] = false
    redirect_to :root
  end
=======
>>>>>>> b3
end
