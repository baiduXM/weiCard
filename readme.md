# 微名片

 - 运行“composer install”命令，加载第三方包
    - 添加扩展包，若composer install后仍未加载，运行下列代码
    ~~~
     composer require davejamesmiller/laravel-breadcrumbs     //面包屑扩展
     composer require zizaco/entrust 5.2.x-dev                //权限管理扩展
    ~~~
 - 将.env.example修改成.env文件，根据本地环境修改配置参数
    - 修改.env配置参数
    ~~~        
        APP_KEY=base64:Bhrr6VfOTOSjZ2JUdHCCeu+bJNA2aDyjtppeZWioQuk=    
        CACHE_DRIVER=array        
    ~~~
