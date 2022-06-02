<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;
    protected $fillable = [
        'name','footer_description','logo','background_login'
    ];


    public function getLogoAttribute($image)
    {
        if (!empty($image)) {
            return asset('uploads/Setting') . '/' . $image;
        }
        return "";
    }

    public function setLogoAttribute($image)
    {

        if (is_file($image)) {
            $imageFields = upload($image, 'Setting');
            $this->attributes['logo'] = $imageFields;

        }

    }

    public function getBackgroundLoginAttribute($image)
    {
        if (!empty($image)) {
            return asset('uploads/Setting') . '/' . $image;
        }
        return "";
    }

    public function setBackgroundLoginAttribute($image)
    {

        if (is_file($image)) {
            $imageFields = upload($image, 'Setting');
            $this->attributes['background_login'] = $imageFields;
        }

    }
}
