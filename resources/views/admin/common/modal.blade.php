{{--确认模态框confirmModal--}}
<div class="modal fade confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                    {{--<input type="hidden" name="ids" value="">--}}
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">确认</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

{{--表单模态框formModal--}}
<div class="modal fade formModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                    {{--<input type="hidden" name="ids" value="">--}}
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">确认</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->