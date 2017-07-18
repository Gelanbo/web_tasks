#!/usr/bin/ruby
class Student
  
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
    puts "Students age: #@age_"
    puts 
  end

end

exist =  File.open("student.yml") if File::exists?("student.yml")
if exist
  puts File.read("student.yml")
else
  student = Array.new(100)
  aFile = File.new("student.yml","w+")
  aFile.syswrite( "id" )
  aFile.syswrite( " " )
  aFile.syswrite( "name" )
  aFile.syswrite( " " )
  aFile.syswrite( "gender" )
  aFile.syswrite( " " )
  aFile.syswrite( "age" )
  aFile.syswrite( "\n" )
  n = 1 
  loop do    
    gender = rand(1..2)
    if gender == 1
      gender_ = "male  "
    else
      gender_ = "female"
    end
    name = rand(36 ** 4).to_s(36)
    age = rand(15..20)
    student[n]=Student.new(n,name,gender_,age)
    student[n].display()    
    if aFile
      aFile.syswrite( n )
      aFile.syswrite( " " )
      aFile.syswrite( name )
      aFile.syswrite( " " )
      aFile.syswrite( gender_ )
      aFile.syswrite( " " )
      aFile.syswrite( age )
      aFile.syswrite( "\n" )
    else
      puts "Unable to open file!"
    end    
    n = n + 1
    break if n == 101  
  end
end
