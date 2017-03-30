{{--确认模态框confirmModal--}}
<div class="modal fade" tabindex="-1" role="dialog" id="confirmModal" aria-labelledby="myModalLabel"
     aria-describedby="myModalContent">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">标题</h4>
            </div>
            <div class="modal-body">
                内容
            </div>
            <div class="modal-footer">
                <form action="" method="post">
                    {{ method_field('DELETE') }}
                    {{ csrf_field() }}
                    {{--<input type="hidden" name="ids" value="">--}}
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">确认</button>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->