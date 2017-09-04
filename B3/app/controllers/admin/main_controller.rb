class Admin::MainController < ApplicationController
  skip_before_action :require_login,only: [:login,:signup,:start_signup,:getoff]
  skip_before_action :require_login,only: [:start_login,:fail_sleep,:fail]

  def login
  end

  def signup
  end

  def sha1(pass)
    Digest::SHA1.hexdigest("---changme--#{pass}--")
  end

  def start_signup
    Admin.find_each do |a|
      if a.adminname == params[:adminname]
        @result = "该用户名已经注册！"
      end
    end

    if @result != "该用户名已经注册！"
      if params[:password_1] != params[:password_2]
        @result = "两次输入的密码不一致。"
      else
        @admin = Admin.new
        @admin.adminname = params[:adminname]
        @admin.password = self.sha1(params[:password_1])
        @admin.save
        @result = "注册成功！"
      end
    end
  end

  def start_login
    if Time.now - 1.minute >= session[:lock_time]
      if session[:login_times] == 3
        session[:login_times] == 0
        session[:lock_time] = Time.now - 1.day
      end
      Admin.find_each do |a|
        if a.adminname == params[:adminname] && a.password == self.sha1(params[:password]) #|| "")#params[:password]
          session[:adminname] = a.adminname
          session[:admin] = true
        end
      end
      if session[:admin] == false
        session[:login_times] = session[:login_times] + 1
        if session[:login_times] == 3
          session[:lock_time] = Time.now
          redirect_to '/admin/fail_sleep'
        else
          redirect_to '/admin/fail'
        end
      else
        redirect_to '/admin/index'
      end
    else
      redirect_to '/admin/fail_sleep'
    end
  end

  def fail_sleep
  end

  def fail
    @result = "登录失败！"
  end

  def index
    @result="登陆成功"
  end

  def getoff
    session[:admin] = false
    redirect_to :root
  end
end
