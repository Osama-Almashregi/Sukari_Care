<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class doctor extends Model
{
    
    protected $table = 'doctors';
    protected $primaryKey = 'id';
    protected $fillable = ['user_id','resume','specialization','status','license_number','license_image','license_expiry_date'];
    public $timestamps = true;
    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
    public function profile(){
        return $this->hasOne(user_profile::class,'user_id');
    }
    
}
