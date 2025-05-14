<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class drug_recommendation extends Model
{
    protected $table = 'drug_recommendations';
     protected $primaryKey = 'id';
     
    protected $fillable = [
        'patient_id',
        'drug_id',
        'when_to_take',
        'time_to_take',
        'number_of_takes',
        'image_url',
    ];
    public function patient(){
        return $this->belongsTo(patient::class,'patient_id');
    }
    public function drug(){
        return $this->belongsTo(drug::class,'drug_id');
    }

}
