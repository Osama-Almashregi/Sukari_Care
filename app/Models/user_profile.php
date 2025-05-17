<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class user_profile extends Model
{
    protected $table='user_profiles';
    protected $primaryKey='id';

    protected $fillable=[
        'user_id',
        'first_name',
        'last_name',
        'date_of_birth',
        'contact_info',
        'gender',
        'image_url',
    ];
    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
    
 
}
