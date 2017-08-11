require File.dirname(__FILE__)+'/message'
require 'sinatra'
require 'erb'
require 'active_record'
require 'digest/sha1'
require 'yaml'

t = File.open("t.yml","r")
a = YAML.load(t)

ActiveRecord::Base.establish_connection(
:adapter => "mysql2",
:host => "localhost",
:username => "#{a['username']}",  # mysql用户名
:password => "#{a['password']}",  # mysql密码
:database => "#{a['database']}" # mysql数据库名
)

class CreateUsers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
    end
  end

  def self.down
    drop_table :users
  end
end
CreateUsers.up
class User < ActiveRecord::Base
  validates :username, presence: String
  validates :password, presence: String
end


class CreateMessagetbls < ActiveRecord::Migration[5.0]
  def self.up
    create_table :messagetbls do |t|
      t.string :content
      t.integer :user_id
      t.string :created_at
    end
  end

  def self.down
    drop_table :messagetbls
  end
end
CreateMessagetbls.up
class Messagetbl < ActiveRecord::Base
  validates :content, length: { minimum: 10 }
end

configure do
  enable :sessions
end

message_arry = Array.new(100)
manager = Manager.new
id = 1


10.times{
  sleep(0.02)
  the_author = rand(36 ** 4).to_s(36)
  a_message = rand(36 ** 15).to_s(36)
  message_arry[id] = manager.add_message(id,a_message,the_author,the_author)
  password = rand(36 ** 10).to_s(36)
  User.create(:username => the_author, :password => password).valid?
  Messagetbl.create(:content => a_message, :user_id =>id, :created_at => message_arry[id].get_time())
  id = id + 1
}



get '/' do
  if session[:admin] == true
      redirect to("start")
  else
      redirect to('login')
  end
end

get '/login' do
  erb:login
end

post '/login' do
  n = 1
  last_user = User.last
  max_id = %{#{last_user.id}}
  loop do
    user = User.find(n)
    if  params[:username] == "#{user.username}" && params[:password] == "#{user.password}"
        session[:admin] = true
        session[:id] = "#{user.id}"
        session[:username] = "#{user.username}"
        session[:password] = "#{user.password}"
        @username = params[:username]
        redirect to("start")
    end
    break if  n == max_id.to_i
    n = n + 1
  end
  erb :fail
end

get '/signup' do
  erb:signup
end

post '/' do
  User.all.each do |user|
    if user.username == params[:username]
      @result = "该用户名已被注册！"
    end
  end
  if @result != "该用户名已被注册！"
    if User.create(:username => params[:username], :password => params[:password]).valid?
      @result = "注册成功！"
    else
      @result = "输入有误！"
    end
  end
  erb:regist_result
end

get "/start" do
  if session[:admin] != true
      redirect to("login")
  else
    if params['id'] != "" && params['id'] != nil
      if params['id'].to_i == 0
        @result = "输入有误！"
      else
        @result = "筛选结果："
        @newarry = Array.new(2)
        @time_ = 1
        @newarry[1] = manager.find_message(message_arry,params['id'].to_i,0)
      end
    elsif params['author'] != "" && params['author'] != nil
      @result = "筛选结果："
      @newarry = Array.new(100)
      @newarry = manager.find_message(message_arry,params['author'],1)
      @time_ = manager.get_rn() - 1
    elsif params['username'] != "" && params['username'] != nil
      @result = "筛选结果："
      @newarry = Array.new(100)
      @newarry = manager.find_message(message_arry,params['username'],2)
      @time_ = manager.get_rn() - 1
    else
      @result = "全部留言："
      @time_ = manager.get()
      @newarry = message_arry
    end
    erb:table
  end
end

get '/delete/:id' do
  if session[:admin] == true
    id_ = params['id'].to_i
    if "#{manager.delete_message(id_,message_arry).class}" == "Fixnum"
      message = Messagetbl.find_by(user_id: params[:id])
      message.destroy
      @result = "删除成功！"
    else
      @result = "删除失败！"
    end
    if "#{id.class}" == "Fixnum"
      manager.set(manager.get() - 1)
    end
    erb:delete
  else
    redirect to('login')
  end
end

get '/add' do
  erb:add
end

post '/add' do
  if session[:admin] != true
      redirect to("login")
  else
    @result = 1
    if params['message'].length < 10
      @result = "内容至少为10个字！"
    elsif params['author'] == ""
      @result = "请输入作者！"
    else
      manager_ = manager.add_message(manager.get() + 1,params['message'],params['author'],session[:username])
      new_id = message_arry[manager.get() - 1].get_id().to_i + 1
      manager_.set_id(new_id)
      message_arry[manager.get()] = manager_
      if Messagetbl.create(:content => params['message'], :user_id =>new_id, :created_at => manager_.get_time()).invalid?
        @result = "创建失败！"
      end
      id = id + 1
      @newarry = message_arry
    end
    erb:addresult
  end
end

get '/edit/:id' do
  if session[:admin] != true
    redirect to("login")
  else
    @id = params['id'].to_i
    @newarry = message_arry
    erb:edit
  end
end

post '/edit/:id' do
  if session[:admin] != true
      redirect to("login")
  else
    id = params['id'].to_i
    message = params['message']
    if message.length < 10
      @result = "内容至少为10个字！请重新输入!"
    else
      n = 1
      loop do
        if message_arry[n].get_id() == "#{id}"
          message_arry[n].set_message(message)
        end
        n = n + 1
        break if n - 1 == manager.get()
      end
      @newarry = message_arry
    end
    erb:editresult
  end
end

get '/myzone' do
  @newarry = Array.new(100)
  @newarry = manager.find_message(message_arry,session[:username],2)
  @time_ = manager.get_rn() - 1
  erb:myzone
end

get '/updatepassword' do
  erb:updatepassord
end

post '/updatepassword' do
  if params['oldpassword'] == "" || params['oldpassword'] == nil
    @result = "原密码输入有误！"
    erb:updateresult
  elsif params['oldpassword'] != session[:password]
    @result = "原密码错误！"
    erb:updateresult
  else
    session[:password] = params[:newpassword]
    user = User.find_by(password: params[:oldpassword])
    user.password = params[:newpassword]
    user.save
    @result = "修改成功！请重新登录！"
    session[:admin] = false
    erb:updateresult
  end
end
