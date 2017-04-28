# 微名片 

### 初始化配置

- 添加composer扩展包

```shell
composer install
```

- 将.env.example另存为.env，修改配置参数

```php
APP_KEY=base64:Bhrr6VfOTOSjZ2JUdHCCeu+bJNA2aDyjtppeZWioQuk=      
//CACHE_DRIVER=array // ?为什么file也可以了？
```

```php
/* email config example */
MAIL_DRIVER=smtp
MAIL_HOST=smtp.qq.com
MAIL_PORT=465
MAIL_USERNAME=
MAIL_PASSWORD=
MAIL_ENCRYPTION=ssl
```

- 修改php.ini文件，upload_max_filesize=10M 上传文件大小限制确保>2M
