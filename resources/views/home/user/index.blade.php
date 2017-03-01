@extends('home.common.layout')
@section('title', '用户')
@section('content')
    <div class="side-right wow bounceInRight animated">
        <div class="mess">
<span>公司名称：
<input name="company" type="text" class="inputt" value="" onfocus="ChangeStyle_hb(this,1,1)"
       onblur="ChangeStyle_hb(this,2,1)">
</span>
            <span>邮箱：
<input name="mail" type="text" class="inputt" value="" onfocus="ChangeStyle_hb(this,1,1)"
       onblur="ChangeStyle_hb(this,2,1)">
</span>
            <span>logo：
<input name="logo" type="text" class="inputt" value="" onfocus="ChangeStyle_hb(this,1,1)"
       onblur="ChangeStyle_hb(this,2,1)">
<a href="javascript:;" class="file">
<input type="file" class="logoimg" value="">上传图片</a>
</span>
            <span>电话：
            <input name="phone" type="text" class="inputt" value="" onfocus="ChangeStyle_hb(this,1,1)"
                   onblur="ChangeStyle_hb(this,2,1)">
            </span>
            <span>传真：<input name="contact" type="text" class="inputt" value="" onfocus="ChangeStyle_hb(this,1,1)"
                            onblur="ChangeStyle_hb(this,2,1)"/></span>
            <div class="inp">
                <a href="javascript:;"><input type="submit" class="not" value="取消"></a>
                <a href="javascript:;"><input type="submit" class="sub" value="确定"></a>
            </div>
        </div>
    </div>
@stop