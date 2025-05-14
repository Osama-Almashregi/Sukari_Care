<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class meal_recommendation extends Model
{
    use Notifiable;
    protected $table = 'meal_recommendations';
    protected $fillable = ['patient_id', 'meal_id','meal_time','meal_setup'];
    public function patient(){
        return $this->belongsTo(patient::class,'patient_id');
    }
    public function meal(){
        return $this->belongsTo(meal::class,'meal_id');
    }
    
}
