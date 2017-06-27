@extends('mobile.common.layout')
@section('title', '模板选择')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
        <div class="muban_wrap">
	        <ul class="muban_content cl">
	        	<input id="userID" type="hidden" value="{{$user->id}}" />
	        	@if($templates)
                    @foreach($templates as $item)
		              <li>
		                <a href="javascript:;">
		                  <div class="div_img"><img src="{{ asset($item->file.'/screenshot.jpg') }}"><em></em></div>
		                  <input type="hidden" value="{{$item->id}}" />
		                  <h2>{{$item->display_name}}</h2>
		                </a>
		              </li>
		        	@endforeach
                @endif
	        </ul>
	    </div>
	</body>
	<div id="muban" class="muban">
	    <div class="mask"></div>
	    <div class="mubanCon popMiddle titlerer bounceInDown go">
	        <div class="close_wrap"><div class="close"></div></div>
	        <div class="pop_img"><img src="images/m3.png"><input type="hidden" value=""></div>	        
	        <a href="#" id="setTP"><div class="choose_card2">设置为模板</div></a>
	    </div>
	</div>
@stop
@section('javascript')
    @parent
    <script src="{{ asset('static/mobile/js/function.js') }}"></script>
    <script src="{{ asset('static/mobile/js/operation.js') }}"></script>
@stop
