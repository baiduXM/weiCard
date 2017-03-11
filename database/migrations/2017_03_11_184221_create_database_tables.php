<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class InitDatabaseTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // if (Schema::hasTable('users')) {
        //     //
        // }
        // if (Schema::hasColumn('users', 'email')) {
        //     //
        // }

        // managers管理员表
        Schema::create('managers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->unique()->comment('账号');
            $table->string('email')->unique();
            $table->string('password');
            $table->rememberToken();
            $table->string('mobile')->unique()->nullable();
            $table->string('nickname')->nullable();
            $table->tinyInteger('is_super')->unsigned()->default(0);
            $table->tinyInteger('is_active')->unsigned()->default(1);
            $table->timestamps();
            $table->softDeletes();
            $table->comment = '管理员表';
        });

        // contacts通讯录表
        Schema::create('contacts', function (Blueprint $table) {
            $table->increments('id');
            $talbe->integer('user_id');
            $talbe->integer('follow_id');
            $talbe->tinyInteger('type');
            $table->string('name');
            $table->string('nickname');
            $table->string('telephone');
            $table->string('mobile');
            $table->string('group');
            $table->string('company');
            $table->string('address');
            $table->string('description');
            $table->timestamps();
        });

        // companies公司表
        Schema::create('companies', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('logo');
            $table->string('address');
            $table->string('telephone');
            $table->string('description');
            $table->string('code');
            $table->tinyInteger('status');            
            $table->timestamps();
            $table->softDeletes();
        });

        // employees员工表
        Schema::create('employees', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });

        // departments部门表
        Schema::create('members', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });

        // templates模板表
        Schema::create('members', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });

        // template_user模板_用户关系表         
        Schema::create('members', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
