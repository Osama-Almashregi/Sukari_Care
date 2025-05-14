<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class exercise_recommendation extends Model
{
    protected $table = 'exercise_recommendations';
    protected $primaryKey = 'id';

    protected $fillable = [
        'exercise_description',
        'exercise_id',
        
    ];
    public function patient(){
        return $this->belongsTo(patient::class,'patient_id');
    }
    public function exercise(){
        return $this->belongsTo(exercise::class,'exercise_id');
    }
}
