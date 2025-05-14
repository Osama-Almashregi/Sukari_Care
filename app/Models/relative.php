<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class relative extends Model
{
    protected $table = 'relatives';
    protected $primaryKey = 'id';
    public $timestamps = true;
    protected $fillable = ['patient_id', 'user_id'];
    public function patient(){
        return $this->belongsTo(patient::class);
    }
    public function user(){
        return $this->belongsTo(user::class);
    }
}
