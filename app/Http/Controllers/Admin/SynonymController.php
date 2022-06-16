<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Project;
use App\Models\Synonym;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Testing\Fluent\Concerns\Has;
use Auth;
use Illuminate\Support\Facades\Hash;

class SynonymController extends Controller
{
    public function index()
    {

        $Users = Synonym::OrderBy('id', 'desc')->get();

        return view('Admin.Synonym.index', compact('Users'));

    }

    public function store(Request $request)
    {

        $this->validate(request(), [
            'word' => 'required|string|unique:synonyms',
            'synonym' => 'required',
            'line_num' => 'required',


        ]);

        $User = new Synonym;
        $User->word = $request->word;
        $User->synonym = $request->synonym;
        $User->line_num=$request->line_num;
        try {
            $User->save();


        } catch (\Exception $e) {
            return back()->with('error_message', 'Failed');
        }
        return redirect()->back()->with('message', 'Success');
    }

    public function delete(Request $request)
    {
        try {
            Synonym::whereIn('id', $request->id)->delete();
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed']);
        }
        return response()->json(['message' => 'Success']);
    }


    public function edit(Request $request)
    {
        $User = Synonym::find($request->id);
        return view('Admin.Synonym.model', compact('User'));
    }


    public function update(Request $request)
    {

        $this->validate(request(), [
            'word' => 'required|string|unique:synonyms,word,' . $request->id,
            'synonym' => 'required',
            'line_num' => 'required',

        ]);


        $User = Synonym::find($request->id);
        $User->word = $request->word;
        $User->synonym = $request->synonym;
        $User->line_num=$request->line_num;


        try {
            $User->save();
        } catch (\Exception $e) {
            return back()->with('message', 'Failed');
        }
        return redirect()->back()->with('message', 'Success');
    }


}
