require File.dirname(__FILE__)+'/message'
require 'sinatra'
require 'erb'

message_arry = Array.new(100)
manager = Manager.new
id = 1
10.times{
 sleep(0.02)
 the_author = rand(36 ** 4).to_s(36)
 a_message = rand(36 ** 15).to_s(36)
 message_arry[id] = manager.add_message(id,a_message,the_author)
 id = id + 1
}

@newarry = message_arry

get '/' do
  if params['id'] != "" && params['id'] != nil
    if params['id'].to_i == 0
      @result = "输入有误！"
    else
      @result = "筛选结果："
      @newarry = Array.new(2)
      @time_ = 1
      @newarry[1] = manager.find_message(message_arry,params['id'].to_i)
    end
  elsif params['author'] != "" && params['author'] != nil
    @result = "筛选结果："
    @newarry = Array.new(100)
    @newarry = manager.find_message(message_arry,params['author'])
    @time_ = $rn - 1
  else
    @result = "全部留言："
    @time_ = $message_num
    @newarry = message_arry
  end
  erb:table
end

get '/delete/:id' do
  id_ = params['id'].to_i
  if "#{manager.delete_message(id_,message_arry).class}" == "Fixnum"
    @result = "删除成功！"
  else
    @result = "删除失败！"
  end
  if "#{id.class}" == "Fixnum"
    $message_num = $message_num - 1
  end
  erb:delete
end

get '/add' do
  erb:add
end

post '/add' do
  @result = 1
  if params['message'].length < 10
    @result = "内容至少为10个字！"
  elsif params['author'] == ""
    @result = "请输入作者！"
  else
    manager_ = manager.add_message($message_num + 1,params['message'],params['author'])
    new_id = message_arry[$message_num - 1].get_id().to_i + 1
    manager_.set_id(new_id)
    message_arry[$message_num] = manager_
    @newarry = message_arry
  end
  erb:addresult
end

get '/edit/:id' do
  @id = params['id'].to_i
  @newarry = message_arry
  erb:edit
end

post '/edit/:id' do
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
      break if n == $message_num
    end
    @newarry = message_arry
  end
  erb:editresult
end
