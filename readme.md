# 微名片


 + /vendor目录 被git忽略，需要运行“composer install”命令，加载第三方包
 + .env文件 被git忽略，用.env.example修改成.env文件，根据本地环境修改配置参数
 + 修改.env中APP_KEY的值： base64:Bhrr6VfOTOSjZ2JUdHCCeu+bJNA2aDyjtppeZWioQuk=
 + 用composer引入breadcrumb（面包屑扩展）所以需要PHP版本>5.6[breadcrumbs扩展](http://www.jianshu.com/p/a7a53052d53a)
 + 用composer引入entrust（权限管理）
 + 查看composer.json文件是否存在"davejamesmiller/laravel-breadcrumbs"和"zizaco/entrust"，存在直接运行composer update，若不存在，运行下面代码
~~~
   composer require davejamesmiller/laravel-breadcrumbs
   composer require zizaco/entrust 5.2.x-dev
~~~

 


# Laravel PHP Framework

[![Build Status](https://travis-ci.org/laravel/framework.svg)](https://travis-ci.org/laravel/framework)
[![Total Downloads](https://poser.pugx.org/laravel/framework/d/total.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Stable Version](https://poser.pugx.org/laravel/framework/v/stable.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Unstable Version](https://poser.pugx.org/laravel/framework/v/unstable.svg)](https://packagist.org/packages/laravel/framework)
[![License](https://poser.pugx.org/laravel/framework/license.svg)](https://packagist.org/packages/laravel/framework)

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable, creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as authentication, routing, sessions, queueing, and caching.

Laravel is accessible, yet powerful, providing tools needed for large, robust applications. A superb inversion of control container, expressive migration system, and tightly integrated unit testing support give you the tools you need to build any application with which you are tasked.

## Official Documentation

Documentation for the framework can be found on the [Laravel website](http://laravel.com/docs).

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](http://laravel.com/docs/contributions).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell at taylor@laravel.com. All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
