#!/usr/bin/ruby
require 'yaml'
class Student
 
  #attr_accessor :id,:name,:gender,:age
  
  def initialize(id,name,gender,age)
    @id_ = id
    @name_ = name
    @gender_ = gender
    @age_ = age
  end

  def display()
    puts "Students id: #@id_" 
    puts "Students name: #@name_" 
    puts "Students gender: #@gender_"
    puts "Students age: #@age_ ","\n" 
  end
 
  def to_yaml_properties
    %w{@id_ @name_ @gender_ @age_}
  end

end

exist =  File.open("studen.yml") if File::exists?("studen.yml")
if exist
    student = YAML::load(File.open("studen.yml"))
    student.display()
else 
  n = 1
  student = Array.new(100)
  100.times{
    
    gender = rand(1..2)
    if gender == 1
      gender_ = "male  "
    else
      gender_ = "female"
    end
    name = rand(36 ** 4).to_s(36)
    age = rand(15..20)
    student[n]=Student.new(n,name,gender_,age)

    puts student[n].to_yaml,"\n"
    data = YAML.dump(student[n])
    n = n + 1 
  }

end

