# weiCard

 + /vendor目录 被git忽略，运行“composer install”命令，加载第三方包`
 + .env文件 被git忽略，用.env.example修改成.env文件，根据本地环境修改配置参数`
 + 修改.env中APP_KEY的值：base64:Q68mWjpqKdhnlGyB/bmf5DmBlyt2jvCaFCJ6Uv1cAdI=`
 + 用composer引入breadcrumb（面包屑扩展）所以需要PHP版本>5.6 
   [breadcrumbs扩展](http://www.jianshu.com/p/a7a53052d53a)

 ~~~
   composer require davejamesmiller/laravel-breadcrumbs
 ~~~
