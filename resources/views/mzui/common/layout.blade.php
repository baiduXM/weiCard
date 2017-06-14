<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>

    <link href="{{ asset('static/mzui/css/mzui.min.css') }}" rel="stylesheet">

    @section('css')
        {{--自定义css--}}
    @show
</head>

<body>

@section('content')
    {{--内容--}}
@show


<script src="{{ asset('static/mzui/js/mzui.min.js') }}"></script>
@section('javascript')
    {{--自定义js--}}
@show
</body>
</html>
