require 'active_record'
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
