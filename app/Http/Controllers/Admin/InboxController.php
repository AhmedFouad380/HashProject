<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Inbox;
use App\Models\InboxFile;
use App\Models\Notification;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Supplier;
use App\Models\Synonym;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Kreait\Firebase\Database\Transaction;
use Kreait\Firebase\Factory;
use Carbon\Carbon;

class InboxController extends Controller
{
    public function index()
    {

        if (Auth::guard('admins')->check()) {
            return redirect('Setting');
        } else {
            $Users = Inbox::Where('receiver_id', Auth::guard('web')->id())->OrderBy('id', 'desc')
                ->root()->get();
        }

        return view('Admin.Inbox.index', compact('Users'));

    }

    public function outbox()
    {

        if (Auth::guard('admins')->check()) {
            $Users = Inbox::OrderBy('id', 'desc')
                ->root()->get();
        } else {
            $Users = Inbox::
            Where('sender_id', Auth::guard('web')->id())->OrderBy('id', 'desc')
                ->root()->get();
        }

        return view('Admin.Inbox.outbox', compact('Users'));

    }

    public function Replies($id)
    {
        $id = decrypt($id);
        $Users = Inbox::whereId($id)->with('childreninboxes')->first();

        if (Auth::guard('admins')->check()) {
            $Users->is_read = 1;
            $Users->save();

        } elseif (!Auth::guard('admins')->check()) {
            $Users->is_read = 1;
            $Users->save();

        }


        return view('Admin.Inbox.replies', compact('Users'));

    }

    public function getUsers($type)
    {

        if ($type == "user") {
            $Users = User::all();
        } else {
            $Users = Supplier::all();
        }

        return response()->json(['users' => $Users]);
    }


    public function store(Request $request)
    {

        $this->validate(request(), [
            'message' => 'required|string',
            'file' => 'sometimes|array',
            'file.*' => 'mimes:jpg,jpeg,png,gif,bmp,pdf,doc,docx',
            'receiver_id' => 'required',

        ]);
        $inbox = new Inbox();
        $inbox->message = $request->message;
        $inbox->receiver_id = $request->receiver_id;
        if (Auth::guard('admins')->check()) {
            $inbox->sender_id = Auth::guard('admins')->user()->id;
        } else {
            $inbox->sender_id = Auth::guard('web')->user()->id;
        }
        $inbox->created_at = Carbon::now('Asia/Riyadh');
        $inbox->save();
        try {
            $inbox->save();

        } catch (\Exception $e) {
            return back()->with('message', 'Failed');
        }

        if ($request->file != null) {
            foreach ($request->file as $file) {
                InboxFile::create([
                    'inbox_id' => $inbox->id,
                    'file' => $file
                ]);
            }
        }

        $message = strip_tags($request->message);
        $message_array = explode(' ', $message);
        $new_message_array = [];
        foreach ($message_array as $word) {
            $syn = Synonym::where('word', $word)->first();
            if ($syn) {
                array_push($new_message_array, $syn->synonym);
            } else {
//                send notification to admin with $word
                foreach ( Admin::all()  as $Admin){
                    $Notification = new Notification();
                    $Notification->message='برجاء اضافه مرادف لكلمه ( ' . $word . ' )';
                    $Notification->admin_id=$Admin->id;
                    $Notification->save();
                }
                array_push($new_message_array, $word);
            }
        }

        return redirect()->back()->with('message', 'Success');
    }


    public function StoreReply(Request $request)
    {

        $this->validate(request(), [
            'message' => 'required|string',
            'file' => 'sometimes|array',
            'file.*' => 'mimes:jpg,jpeg,png,gif,bmp,pdf,doc,docx',


        ]);
        $parent_inbox = Inbox::whereId($request->inbox_id)->first();


        $inbox = new Inbox();
        $inbox->message = $request->message;
        $inbox->inbox_id = $request->inbox_id;

        if (Auth::guard('admins')->check()) {
            $inbox->sender_id = Auth::guard('admins')->user()->id;
            $inbox->sender_type = "admin";
            if ($parent_inbox->sender_type != "admin") {
                $inbox->receiver_id = $parent_inbox->sender_id;
                $inbox->receiver_type = $parent_inbox->sender_type;
            } else {
                $inbox->receiver_id = $parent_inbox->receiver_id;
                $inbox->receiver_type = $parent_inbox->receiver_type;
            }

        } else {
            $inbox->sender_id = Auth::guard('web')->user()->id;

            $inbox->receiver_id = $parent_inbox->sender_id;

        }


        try {
            $inbox->save();

            $message = strip_tags($request->message);
            $message_array = explode(' ', $message);
            $new_message_array = [];
            foreach ($message_array as $word) {
                $syn = Synonym::where('word', $word)->first();
                if ($syn) {
                    array_push($new_message_array, $syn->synonym);
                } else {
//                send notification to admin with $word
                    foreach ( Admin::all()  as $Admin){
                        $Notification = new Notification();
                        $Notification->message='برجاء اضافه مرادف لكلمه ( ' . $word . ' )';
                        $Notification->admin_id=$Admin->id;
                        $Notification->save();
                    }
                    array_push($new_message_array, $word);
                }
            }

        } catch (\Exception $e) {
            return back()->with('message', 'error');
        }

        if ($request->file != null) {
            foreach ($request->file as $file) {
                InboxFile::create([
                    'inbox_id' => $inbox->id,
                    'file' => $file
                ]);
            }
        }

        return redirect()->back()->with('message', 'Success');
    }


}
