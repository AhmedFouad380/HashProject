<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Str;


class Inbox extends Model
{
    use HasFactory;

    protected $fillable = [
        'message', 'inbox_id', 'sender_id', 'receiver_id',
        'is_read', 'sender_type'
    ];


    protected $hidden = ['file'];
    protected $with = ['files'];
    public $timestamps = false;


    protected $casts = [
        'is_read' => 'integer',
        'created_at' => 'datetime:Y-m-d h:i',
    ];


    protected $appends = ['hashed_message'];

    public function getHashedMessageAttribute()
    {
        $message = strip_tags($this->message);
        $message_array = explode(' ', $message);
        $new_message_array = [];
        foreach ($message_array as $word) {
            $syn = Synonym::where('word', $word)->first();
            if ($syn) {
                array_push($new_message_array, $syn->synonym);
            } else {
////                send notification to admin with $word
//                foreach ( Admin::all()  as $Admin){
//                $Notification = new Notification();
//                $Notification->message='برجاء اضافه مرادف لكلمه ( ' . $word . ' )';
//                $Notification->admin_id=$Admin->id;
//                $Notification->save();
//                }
                array_push($new_message_array, $word);
            }
        }


        $new_message = implode(' ', $new_message_array);

        $Ascii = $this->string_to_ascii($new_message);

        return $Ascii;
    }

    function string_to_ascii($string)
    {
        $ascii = NULL;

        for ($i = 0; $i < strlen($string); $i++)
        {
            $ascii = $ascii . " " .ord($string[$i]);
        }

        return($ascii);
    }

    public function files()
    {
        return $this->hasMany(InboxFile::class, 'inbox_id');
    }

    public function inboxes()
    {
        return $this->hasOne(Inbox::class);
    }

    public function scopeRoot($query)
    {
        return $query->where('inbox_id', null);
    }

    public function childreninboxes()
    {
        return $this->hasMany(Inbox::class)->with('inboxes')->orderBy('id', 'desc');
    }


    public function getFileAttribute($image)
    {

        if (!empty($image)) {
            return asset('uploads/inboxes') . '/' . $image;
        }
        return "";
    }

    public function setFileAttribute($image)
    {

        if (is_file($image)) {
            $imageFields = upload($image, 'inboxes');
            $this->attributes['file'] = $imageFields;

        }

    }


    public function getSender()
    {


        return $this->hasOne('App\Models\User', 'id', 'sender_id');
    }


    public function getReciever()
    {

        return $this->hasOne('App\Models\User', 'id', 'receiver_id');

    }

    public function getMessageAttribute($Message)
    {
        $decrypt = Crypt::decryptString($Message);
        return $decrypt;
    }

    public function setMessageAttribute($Message)
    {

        $encrypted = Crypt::encryptString($Message);
        $this->attributes['message'] = $encrypted;


    }


}
