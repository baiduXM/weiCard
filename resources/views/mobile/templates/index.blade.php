@extends('mobile.common.layout')
@section('title', '个人模板选择')
@section('css')
    @parent
	<link href="{{ asset('static/mobile/css/swiper.min.css') }}" rel="stylesheet">
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
	<div class="card_choose card_choose1">
		<ul>
			<li class="on"><a href="{{ url('template/mobile-change') }}">个人模板</a></li>
			<li><a href="{{ url('template/com-template') }}">企业模板</a></li>
		</ul>
	</div>
        <div class="muban_wrap">
	        <ul class="muban_content cl">
	        	<input id="userID" type="hidden" value="{{$user->id}}" />

				@if($templates)
					@foreach($templates as $item=>$value)
						<li data-id="{{$item}}">
							<a href="javascript:;">
								<div class="div_img"><img src="{{ asset($value->file.'/screenshot.jpg') }}"><em></em>
									@if($this_template)
										@if($this_template->id==$value->id)
											<div class="selected hide show">
												<img src="{{ asset('static/mobile/images/selected.png') }}" alt=""> <br>
												<span>已选中</span>
											</div>
										@endif
									@endif
								</div>
								<input type="hidden" value="{{$value->id}}" />
								<h2>{{$value->name}}</h2>
							</a>
						</li>
					@endforeach
				@endif

	        	{{--@if($templates)--}}
                    {{--@foreach($templates as $item)--}}
		              {{--<li>--}}
		                {{--<a href="javascript:;">--}}
		                  {{--<div class="div_img"><img src="{{ asset($item->file.'/screenshot.jpg') }}"><em></em>--}}
							  {{--@if($this_template)--}}
							  {{--@if($this_template->id==$item->id)--}}
								  {{--<div class="selected hide show">--}}
									  {{--<img src="{{ asset('static/mobile/images/selected.png') }}" alt=""> <br>--}}
									  {{--<span>已选中</span>--}}
								  {{--</div>--}}
							  {{--@endif--}}
							  {{--@endif--}}
						  {{--</div>--}}
		                  {{--<input type="hidden" value="{{$item->id}}" />--}}
		                  {{--<h2>{{$item->name}}</h2>--}}
		                {{--</a>--}}
		              {{--</li>--}}
		        	{{--@endforeach--}}
                {{--@endif--}}
	        </ul>
	    </div>
	</body>
	<div id="muban" class="muban">
	    <div class="mask"></div>
		<div class="mubanCon popMiddle titlerer bounceInDown go">
			<div class="close_wrap"><div class="close"></div></div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					@if($templates)
						@foreach($templates as $item=>$value)
							<div class="swiper-slide">
								<div class="pop_img"><img src="{{ asset($value->file.'/screenshot.jpg') }}"></div>
								<a class="choose_card3" href="{{ url('template/change-u/'.$value->id) }}"></a>
							</div>
						@endforeach
					@endif

				</div>
			</div>
			<div class="choose_card4">设置个人模板</div>
		</div>

	    {{--<div class="mubanCon popMiddle titlerer bounceInDown go">--}}
	        {{--<div class="close_wrap"><div class="close"></div></div>--}}
	        {{--<div class="pop_img"><img src="images/m3.png"><input type="hidden" value=""></div>	        --}}
	        {{--<a href="#" id="setTP"><div class="choose_card2">设置为个人模板</div></a>--}}
	    {{--</div>--}}
	</div>
@stop
@section('javascript')
    @parent
	<script src="{{ asset('static/mobile/js/swiper.min.js') }}"></script>
	<script src="{{ asset('static/mobile/js/function_com.js') }}"></script>
    <script src="{{ asset('static/mobile/js/operation.js') }}"></script>
@stop
