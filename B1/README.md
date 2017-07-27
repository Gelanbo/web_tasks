网页留言板 程序说明
====
rb文件：message.rb,test.rb<br>
erb模板文件：存放在/views/目录下的table.erb，add.erb，delete.erb，edit.erb，editresult.erb，addresylt.erb<br><br> 
message.rb文件包含两个类：留言类Message，用于创建每个留言对象，含有id，author，message，created_at；留言管理类Manager，里面有用于实现添加留言、 删除留言、查找留言的三个方法。
test.rb文件中，创建message_arry数组，用于存放所有的留言对象；manager为Manager类的实例化对象，用于对留言实现增，删，查操作。<br>
为了便于程序测试，首先随机生成了10个留言对象（author，message均为随机字符串），并存放在message_arry数组中，用sleep()方法，每隔一定时间创建对象，可以直观判断 留言的时间倒序排列结果，但是这样会使程序运行时间增加。这些操作仅为程序功能测试。
5个路由，分别实现相应页面操作。get/ 显示留言并实现留言筛选和删除功能，模板table.erb中设置了form表单，用于筛选留言，每条留言均可删除或编辑留言内容；post/add 添加留言，模板add.erb；get/delete/:id 删除留言，模板delete.erb 显示删除结果，并设置返回首页按钮；get/edit/:id 进入留言编辑页面，模板edit.erb设置了留言编辑框，用于重新提交留言内容；post/edit/:id 实现留言编辑功能，模板editresult.erb显示编辑结果，并设置返回首页按钮。 
<br><br>
关于留言管理：<br>
全局变量$message_num表示当前留言的数量，每次add留言或delete留言会使其值发生变化，该变量主要用于参数判断，以及便于实现留言的增删查操作。<br>
由于id不可重复且自增，故id从1开始生成，初始时作为message_arry数组下标，无论如何进行删除操作，任何时候保证数组的索引值大的，其id大。这洋，按照数组元素倒序输出时，同时保证了按时间倒序输出。 输出采用循环，输出次数由当前$message_num决定。
<br><br>
关于用户输入信息判断：<br>
筛选：保证id为Fixnum类型，否则提示“输入有误！”；<br>
添加：提交表单中message长度大于10，否则显示“内容至少为10个字！”；作者不为空，否则显示“请输入作者！”；<br>
编辑留言：保证编辑内容长度大于10，否则在新页面提示“内容至少为10个字！请重新输入!<br>

更新完善程序：<br>
1.添加post入口，在首页get/加入“添加留言”按钮，点击进入“添加留言”编辑页面（add.erb），提交后在新页面（addresylt.erb）显示添加结果（长度不符合要求或者添加成功），添加成功时设置返回首页按钮。<br>
2.已将原message.rb文件中的程序测试与路由部分放入test.rb文件中，message.rb保留留言类和留言管理类。<br>
3.由于路由不在message.rb文件中，使用configure需要包含'sinatra'，而message.rb文件包含'sinatra'后，运行test.rb无法启用网页，所以暂未使用configure。<br>
4.已删除多余代码。<br>
5.已改正erb文件中访问params，使用了@传值。<br>
6.其他类型to_i转fixnum为0，这个我是知道的，在这里使用是由于：为了便于按照一定顺序输出留言和实现增删查操作，留言数组存储留言是从第二个（下标为1）开始存储，id值最小为1，且按照要求自增不可重复，
所以fixnum的id不会出现0的情况。<br>
7.关于遍历数组：这个地方不是在遍历数组，message_arry并不是每个元素都存有留言对象，只是初始设置最大留言容量为99，在这里只能根据当前$message_num决定循环次数，只有数组的第2至第$message_num个元素，才可以访问。
若要使用do end，换用了loop循环。
