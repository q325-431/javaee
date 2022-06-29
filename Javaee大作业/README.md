# 项目访问

- 本项目已经部署到自己购买的腾讯云服务器，其访问URL如下：http://www.yfuxdeer.com:8520/terminal/

# 本机访问

1. 首先解压terminal.zip，解压之后得到的是terminal文件夹
2. 右击文件夹，以IDEA打开
3. 设置好自己的Maven路径、JDK路径和tomcat配置
4. 在启动tomcat之前，你必须完成下列几件事
   1. 先将`\terminal\src\main\resources\SALESYSTEM.sql`的SQL脚本于自己的MySQL数据库中执行一遍[**注意，数据库使用的是MySQL数据库,不是Oracle**]
   2. 再修改`\terminal\src\main\resources\druid.properties`中的url，username，password为自己数据库的信息
5. 启动tomcat即可在浏览器打开首页
6. 项目成功启动后，某些功能需要登录查看，其账号密码如下：
   - 账号：1653727226@qq.com
   - 密码：as123456789