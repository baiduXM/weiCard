# 微名片 

### 使用框架 

- laravel 5.2.45
- php >5.6
- bootstrap 3.3.7
- jquery 1.11.3
- jquery.Uploadify 	v3.2.1(-未使用)
- vue.js v2.2.1(-未使用)
- clipboard.min.js <!--剪切板-->
- jquery.timers-1.2.js <!--jquery定时器-->

### 初始化配置

- 添加composer扩展包
```shell
composer install
```
- 将.env.example另存为.env，修改配置参数
- 生成新KEY
```php
php artisan key:generate  
```

### 修改php.ini
- upload_max_filesize=10M 上传文件大小限制确保>2M

