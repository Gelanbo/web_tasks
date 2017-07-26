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

  def set_id(id)
    @id = id
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
