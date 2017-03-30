@extends('home.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">我的公司 > </a></li>
            <li class="cont-nav-act"><a href="">我的公司</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href="">我的公司</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <p>
                2005年，易尔通被百度授权建立了厦门地区“百度厦门营销服务中心”，该服务中心为厦门地区的百度客户提供专业的服务。2007年11月，百度正式授权易尔通为福建漳州、龙岩地区核心代理。
                目前我们的客户服务中心为厦门、泉州、漳州、龙岩及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。
            </p>
            <p class="add-btn">
                <button>确认添加</button>
                <button>取消添加</button>
            </p>
        </div>

    </div>
@stop