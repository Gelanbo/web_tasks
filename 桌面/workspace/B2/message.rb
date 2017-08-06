class Message
  def initialize(id,message,author,created_at,username)
    @id = id
    @message = message
    @author = author
    @created_at = created_at
    @username = username
  end

  def get_message
    "#@id  #@message  #@author  #@created_at  #@username"
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

  def get_time
    "#@created_at"
  end

  def get_username
    "#@username"
  end

  def set_message(message)
    @message = message
  end

  def set_id(id)
    @id = id
  end

end

class Manager
  def initialize()
    @message_num = 0
    @rn = 1
  end

  def get()
     "#@message_num".to_i
  end

  def get_rn()
    "#@rn".to_i
  end

  def set(num)
    @message_num = num
  end

  def add_message(id,message,author,username)
    time = Time.new
    message_ = Message.new(id,message,author,time.inspect,username)
    @message_num = @message_num + 1
    return message_
  end

  def delete_message(id,arry)
    if "#{id.class}" == "Fixnum"
      if id > @message_num + 1
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
        @message_num = @message_num - 1
        break if n == 0
      end
      return id.size
    end
  end

  def find_message(arry,id_or_author_or_username,type)
    @rn = 1
    if type == 0
      if "#{id_or_author_or_username.class}" == "Fixnum"
        n = 1
        @message_num.times{
          if arry[n].get_id == "#{id_or_author_or_username}"
            return arry[n]
          end
          n = n + 1
        }
        return "无此留言！"
      end
    elsif type == 1
      rearry = Array.new(100)
      n = 1
      @message_num.times{
        if arry[n].get_author == "#{id_or_author_or_username}"
          rearry[@rn] = arry[n]
          @rn = @rn + 1
        end
        n = n + 1
      }
      if @rn == 1
        return "无此留言！"
      else
        return rearry
      end
    else type == 2
      rearry = Array.new(100)
      n = 1
      @message_num.times{
        if arry[n].get_username == "#{id_or_author_or_username}"
          rearry[@rn] = arry[n]
          @rn = @rn + 1
        end
        n = n + 1
      }
      if @rn == 1
        return "无此留言！"
      else
        return rearry
      end
    end
  end
end
