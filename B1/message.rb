require 'sinatra'
require 'erb'

$message_num = 0

class Message
  def initialize(id,message,author,created_at)
    @id = id
    @message = message
    @author = author
    @created_at = created_at
  end

  def get_message
    "#@id  #@message  #@author  #@created_at"
  end

  def get_author
    "#@author"
  end

  def get_id
    "#@id"
  end

  def get_message_
    "#@message"
  end

  def set_message(message)
    @message = message
  end

end

class Manager

  def add_message(id,message,author)
    time = Time.new
    message_ = Message.new(id,message,author,time.inspect)
    $message_num = $message_num + 1
    return message_
  end

  def delete_message(id,arry)
    if "#{id.class}" == "Fixnum"
      if id > $message_num + 1
        return "删除失败！"
      else
        100.times{
          arry[id] = arry[id+1]
          id = id + 1
        }
        return 1
      end
    else
      n = id.size
      loop do
        manager_ = Manager.new
        deletenu = manager_.delete_message(id[n-1],arry)
        n = n - 1
        $message_num = $message_num - 1
        break if n == 0
      end
      return id.size
    end
  end

  def find_message(arry,id_or_author)
    if "#{id_or_author.class}" == "Fixnum"
      n = 1
      $message_num.times{
        if arry[n].get_id == "#{id_or_author}"
          return arry[n]
        end
        n = n + 1
      }
      return "无此留言！"
    else
      rearry = Array.new(100)
      n = 1
      $rn = 1
      $message_num.times{
        if arry[n].get_author == "#{id_or_author}"
          rearry[$rn] = arry[n]
          $rn = $rn + 1
        end
        n = n + 1
      }
      if $rn == 1
        return "无此留言！"
      else
        return rearry
      end
    end
  end

end

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

post '/add' do
  @result = 1
  if params['message'].length < 10
    @result = "内容至少为10个字！"
  elsif params['author'] != ""
    @result = "请输入作者！"
  else
    @new_message = Message.new($message_num + 1,params['message'],params['author'],time.inspect)
    $message_num = $message_num + 1
  end
  erb:add
end

get '/edit/:id' do
  n = 1
  @newarry = message_arry
  puts '/edit/:id'.encode
  erb:edit
end

post '/edit/:id' do
  id = params['id'].to_i
  message = params['message']
  if message.length < 10
    @result = "内容至少为10个字！请重新输入!"
  else
    n = 1
    $message_num.times{
      if message_arry[n].get_id() == "#{id}"
        message_arry[n].set_message(message)
      end
      n = n + 1
    }
    @newarry = message_arry
  end
  erb:editresult
end
