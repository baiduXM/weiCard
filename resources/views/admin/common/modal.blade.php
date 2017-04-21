<div class="modal fade confirmModal" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-describedby="myModalContent">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">标题</h4>
            </div>
            <form action="" method="post">
                {{ method_field('DELETE') }}
                {{ csrf_field() }}
                <div class="modal-body">
                    内容
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">确认</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- 确认模态框confirmModal -->

<div class="modal fade formModal" id="bindingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-describedby="myModalContent">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">标题</h4>
            </div>
            <form action="" method="post">
                {{ csrf_field() }}
                <div class="modal-body">
                    <div class="form-group {{ $errors->has('code') ? ' has-error' : '' }}">
                        <label class="col-md-3 control-label" for="code">绑定代码</label>
                        <div class="col-md-6">
                            <input id="code" name="code" type="text" placeholder="绑定代码"
                                   class="form-control" value="{{ old('code') }}">
                        </div>
                        @if ($errors->has('code'))
                            <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('code') }}</strong>
                                </span>
                        @endif
                    </div><!-- code绑定代码 -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">确认</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- 绑定模态框bindingModal -->

<div class="modal fade formModal" id="verifiedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-describedby="myModalContent">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">标题</h4>
            </div>
            <form action="" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}
                {{ method_field('put') }}
                <div class="modal-body">
                    {{--<div class="form-group">--}}
                    {{--<label class="col-md-3 control-label" for="status">审核状态</label>--}}
                    {{--<div class="col-md-6">--}}
                    {{--@foreach($company->getStatus() as $item => $value)--}}
                    {{--<div class="radio">--}}
                    {{--<label>--}}
                    {{--<input type="radio" name="Company[status]" value="{{ $item }}"--}}
                    {{--@if(old('Company.status') === null)--}}
                    {{--{{ $company->status == $item ? 'checked' : '' }}--}}
                    {{--@else--}}
                    {{--{{ old('Company.status') == $item ? 'checked' : '' }}--}}
                    {{--@endif--}}
                    {{-->{{ $value }}--}}
                    {{--</label>--}}
                    {{--</div>--}}
                    {{--@endforeach--}}
                    {{--</div>--}}
                    {{--</div><!-- status审核状态 -->--}}
                    {{--<div class="form-group {{ $errors->has('Company.reason') ? ' has-error' : '' }}">--}}
                    {{--<label class="col-md-3 control-label" for="reason">失败原因</label>--}}
                    {{--<div class="col-md-6">--}}
                    {{--<textarea id="reason" name="Company[reason]" class="form-control"--}}
                    {{--rows="3" placeholder="审核失败原因">{{ old('Company.reason') }}</textarea>--}}
                    {{--</div>--}}
                    {{--@if ($errors->has('Company.reason'))--}}
                    {{--<span class="help-block col-md-3">--}}
                    {{--<strong>{{ $errors->first('Company.reason') }}</strong>--}}
                    {{--</span>--}}
                    {{--@endif--}}
                    {{--</div><!-- reason失败原因 -->--}}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">确认</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- 审核模态框verifiedModal -->

<div class="modal fade" id="shareModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-describedby="myModalContent">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">标题</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="code-shareModal">原始代码</label>
                        <div class="col-xs-6">
                            <input class="form-control" type="text" id="code-shareModal" name="code" value="" readonly/>
                        </div>
                        <button type="button" class="btn btn-primary code" id="copy-code" data-dismiss="modal"
                                data-clipboard-target="#code-shareModal">复制
                        </button>
                    </div><!-- 原始代码 -->
                    <div class="form-group">
                        <label class="col-xs-3 control-label" for="url-code-shareModal">URL代码</label>
                        <div class="col-xs-6">
                            <input class="form-control" type="text" id="url-code-shareModal" name="url-code" readonly/>
                        </div>
                        <button type="button" class="btn btn-primary url-code" id="copy-url-code" data-dismiss="modal"
                                data-clipboard-target="#url-code-shareModal">复制
                        </button>
                    </div><!-- URL代码 -->
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- 分享模态框#shareModal -->

<div class="modal fade hintModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-describedby="myModalContent">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                内容
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- 提示模态框.hintModal -->