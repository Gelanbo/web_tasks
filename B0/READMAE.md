# RuBy程序说明
程序创建了类Student，含有initialize()方法与display()方法。其中initialize()方法用于初始化变量：id,name,gender,age；display()方法用于输出随机生成的学生信息。<br>
主程序中先判断文件“student.yml”存在性：exist =  File.open("student.yml") if File::exists?("student.yml")，如果该文件已经存在，则输出文件内容：
puts File.read("student.yml")。若文件不存在，则新建文件aFile = File.new("student.yml","w+")，并先在文件头部写入项目名：id,name,gender,age。数组student[]用于存放实例化对象，
即存放循环生成的100个学生对象，这里选用loop循环来完成。在循环体内，先随机产生学生信息，id按顺序从1至100，name使用rand(36 ** 4).to_s(36)随机产生包含数字和字母的4位字符串，作为学生姓名。
age使用rand(15..20)来产生15~20的随机数。接下来实例化对象，以上参数将作为每个学生对象的实例变量，并调用display()方法输出学生信息。每个学生间用空格分离。
之后，将信息写入文件“student.yml”。最后，n即id的值+1，直至输出100个学生信息，并用来作为循环结束的条件。
