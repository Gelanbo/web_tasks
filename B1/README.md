网页留言板 程序说明
==
rb文件：message.rb<br>
erb模板文件：存放在/views/目录下的table.erb, add.erb, delete.erb, edit.erb, editresult.erb
<br><br>
message.rb文件包含两个类：留言类Message，用于创建每个留言对象，含有id，author，message，created_at；留言管理类Manager，里面有用于实现添加留言、
删除留言、查找留言的三个方法。主程序中创建message_arry数组，用于存放所有的留言对象；manager为Manager类的实例化对象，用于对留言实现增，删，查操作。<br>
为了便于程序测试，首先随机生成了10个留言对象（author，message均为随机字符串），并存放在message_arry数组中，用sleep()方法，每隔一定时间创建对象，可以直观判断
留言的时间倒序排列结果，但是这样会使程序运行时间增加。这些操作仅为程序功能测试。<br>
5个路由，分别实现相应页面操作。get/ 显示留言并实现留言筛选和删除功能，模板table.erb中设置了form表单，用于筛选留言，每条留言均可删除或编辑留言内容；post/add 添加留言，模板add.erb；get/delete/:id 删除留言，模板delete.erb
显示删除结果，并设置返回首页按钮；get/edit/:id 进入留言编辑页面，模板edit.erb设置了留言编辑框，用于重新提交留言内容；post/edit/:id 实现留言编辑功能，模板editresult.erb显示编辑结果，并设置返回首页按钮。
<br><br>
关于留言管理：<br>
全局变量$message_num表示当前留言的数量，每次add留言或delete留言会使其值发生变化，该变量主要用于参数判断，以及便于实现留言的增删查操作。<br>
由于id不可重复且自增，故id从1开始生成，初始时作为message_arry数组下标，无论如何进行删除操作，任何时候保证数组的索引值大的，其id大。这洋，按照数组元素倒序输出时，同时保证了按时间倒序输出。
输出采用循环，输出次数由当前$message_num决定。<br><br>
关于用户输入信息判断：<br>
筛选：保证id为Fixnum类型，否则提示“输入有误！”；<br>
添加：提交表单中message长度大于10，否则显示“内容至少为10个字！”；作者不为空，否则显示“请输入作者！”；<br>
编辑留言：保证编辑内容长度大于10，否则在新页面提示“内容至少为10个字！请重新输入!”
