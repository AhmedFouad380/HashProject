<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use GrahamCampbell\ResultType\Success;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notification;
use Auth;
class NotificationController extends Controller
{
    public function ReadNotification(){
        \App\Models\Notification::where('admin_id',Auth::guard('admins')->id())->where('is_read','0')->update(array('is_read'=>'1'));
return 200;
    }
}
