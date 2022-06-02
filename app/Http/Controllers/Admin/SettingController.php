<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function index(){

        $Setting = Setting::find(1);
        return view('Admin.Setting.index',compact('Setting'));

    }


    public function store(Request $request)
    {

        $this->validate(request(),[
            'name' => 'required|string',
            'footer_description' => 'required|string',
            'logo' => 'image|mimes:png,jpg,jpeg|max:2048',
            'background_login' => 'image|mimes:png,jpg,jpeg|max:2048',
        ]);

        $Setting=new Setting;


        if($file1=$request->file('logo')){
            $name='img' .time() . '.' .$file1->getClientOriginalExtension();
            $file1->move(public_path('Upload'), $name);
            $Setting->logo=$name;

        }

        if($file2=$request->file('background_login')){
            $name='img' .time() . '.' .$file2->getClientOriginalExtension();
            $file2->move(public_path('Upload'), $name);
            $Setting->background_login=$name;

        }


        try {
            $Setting->save();
        } catch (Exception $e) {
            return redirect('/Setting')->with('error_message', 'Failed');
        }
        return redirect()->back()->with('message', 'Success');
    }

    public function delete(Request $request)
    {
        try{
            Setting::whereIn('id',$request->id)->delete();
        } catch (\Exception $e) {
            return response()->json(['message'=>'Failed']);
        }
        return response()->json(['message'=>'Success']);
    }


    public function edit(Request $request)
    {
        $Setting=Setting::find($request->id);
        return view('Admin.Setting.model',compact('Setting'));
    }


    public function update(Request $request)
    {

        $this->validate(request(),[
            'name' => 'required|string',
            'footer_description' => 'required|string',
            'logo' => 'image|mimes:png,jpg,jpeg|max:2048',
            'background_login' => 'image|mimes:png,jpg,jpeg|max:2048',

        ]);


        $Setting= Setting::find($request->id);

        $Setting->name = $request->name;
        $Setting->footer_description = $request->footer_description;
        $Setting->logo=$request->logo;
        $Setting->background_login=$request->background_login;

        try {
            $Setting->save();

        } catch (Exception $e) {
            return back()->with('error_message', 'هناك خطأ ما فى عملية الاضافة');
        }
        return redirect()->back()->with('message', 'Success');
    }


}
