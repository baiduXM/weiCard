<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Employee;
use App\Models\Message;
use Breadcrumbs;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class MessageController extends HomeController
{
    //
    public function index()
    {
        $messages = '';
        return view('mobile.message.index')->with(
            [
                'messages' => $messages,
            ]);
    }

    /*留言列表页*/
    public function messagelist()
    {

        $messages = Message::where('user_id', Auth::id())->orderBy('is_read','asc')->orderBy('created_at','desc')->get();
        return view('mobile.message.list')->with(
            [
                'messages' => $messages,
            ]);

    }

    /*留言页面*/
    public function write($id)
    {
        $messages = '';
        $uid=$id;
        $success='';
        return view('mobile.message.write')->with(
            [
                'messages' => $messages,
                'uid'       => $uid,
                'success'       => $success,
            ]);

    }

    /*留言提交*/
    public function messagepost (Request $request)
    {
        /*验证*/
        $this->validate($request, [
            'Message.title'   => 'required|max:255',
            'Message.name'    => 'required|max:255',
            'Message.phone'   => 'digits:11|required',
            'Message.email'   => 'email|max:255',
            'Message.content' => 'required|max:255',
            'Message.uesr_id' => '',
        ], [], [
            'Message.title'   =>  '主题',
            'Message.name'    =>   '姓名',
            'Message.phone'   => '手机',
            'Message.email'   => '邮箱',
            'Message.content' => '内容',
            'Message.user_id' => 'userid',
        ]);
        $data = $request->input('Message');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null;//未填字段设置为null，否则会保存''
            }
        }
        $data['is_read']='0';
        $employee =Employee::where('user_id',$data['user_id'])->first();
        if(Message::create($data)) {
      return redirect('message-success/'.$employee->id);
//          return redirect('cardview/e-'.$employee->id)->with('success', '添加成功');
//            echo "<script>alert('留言成功');</script>";
//            return redirect('company');
//            $err_code = 300;
//            return redirect()->back();
//            $success='111';
//            return back()->with('success', $success);
        }else{
            return redirect('message-error/'.$employee->id);
//            echo "<script>alert('留言失败，请联系管理员');</script>";
//            $err_code = 301;
//            return redirect()->back()->with('error', '留言板出错，请联系管理员');
        }
    }

    /*留言详情页*/
    public function messagedetail($id)
    {

        $message = Message::where('id',$id)->first();
        $message->is_read='1';
        $message->save();
        return view('mobile.message.detail')->with(
            [
                'message' => $message,
            ]);

    }

    /*留言成功返回页面*/
    public function messagesuccess($id){

        return view('mobile.message.success')->with(
            [
                'id' => $id,
            ]);
    }

    /*留言失败返回页面*/
    public function messageerror($id){

        return view('mobile.message.error')->with(
            [
                'id' => $id,
            ]);
    }

}
