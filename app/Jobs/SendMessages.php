<?php

namespace App\Jobs;

use App\Jobs\Job;
use App\Models\User;
use Illuminate\Mail\Mailer;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendMessages extends Job implements ShouldQueue
{
    use InteractsWithQueue, SerializesModels;

    protected $user;

    /**
     * SendMessages constructor.
     * 创建一个新的任务实例
     *
     * @param User $user
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * Execute the job.
     *
     * @param Mailer $mailer
     * @return void
     */
    public function handle(Mailer $mailer)
    {
        /* 执行任务 */
        $mailer->send('emails.reminder', ['user' => $this->user], function ($m) {
            //
        });
        $this->user->reminders()->create();

        /* 手动释放任务 */
        if (1) {
            $this->release(10);
        }
        /* 检查尝试运行次数 */
        if ($this->attempts() > 3) {
            //
        }
    }
}
