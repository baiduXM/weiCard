@extends('home.common.layout')
@section('title', '通讯录')
@section('content')
    <div class="side-nav wow bounceInRight animated">
        <div class="top">通讯录</div>
        <div class="nav_choose">
            <div class="buttom">
                <a href="javascript:;"><input type="submit" class="delete" value="批量删除"></a>
                <span class="ri-buttom">
                            <a href="javascript:;"><input type="submit" class="add" value="添加栏目"></a>
                            <a href="javascript:;"><input type="submit" class="adds" value="批量添加栏目"></a>
                         </span>
            </div>
            <ul class="contact">
                <li class="current">全部</li>
                <li class="zimu">A-Z∨
                    <ul class="word">
                        <li>A-Z</li>
                        <li>Z-A</li>
                    </ul>
                </li>
                <li>∨</li>
                <li class="all"><input name="allbox" type="checkbox" class="checkAll" rel="item" /> 全选</li>
            </ul>
        </div>
        <ul class="people_list">
            @foreach($contact as $contact)
            <li>
                <div class="people">
                    <div class="left">
                        <div class="photo"><i><img src="images/contact.jpg"></i></div>
                        <p class="name">{{ $contact->name }}</p>
                    </div>
                    <div class="right">
                        <span><input class="child" name="nav" type="checkbox" value="" /></span>
                        <div class="down"></div>
                    </div>
                </div>
                <ul class="tact">
                    <li><div class="span"><img src="images/phon.png"></div><p><a href="">查看</a></p></li>
                    <li><dic class="span"><img src="images/phon.png"></dic><p><a href="">查看</a></p></li>
                    <li><div class="span"><img src="images/phon.png"></div><p><a href="">查看</a></p></li>
                    <li><dic class="span"><img src="images/phon.png"></dic><p><a href="">查看</a></p></li>
                </ul>
            </li>
            @endforeach
        </ul>
    </div>
@stop