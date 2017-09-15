# 微名片 

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
- curl.cainfo="[PATH]\Apache\bin\curl-ca-bundle.crt"

