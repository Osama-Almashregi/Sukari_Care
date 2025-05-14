<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class physical_examination extends Model
{
    
    protected $table = 'physical_examination';
    protected $primaryKey = 'id';
    protected $foreignkey = 'patient_id';
    protected $fillable =[
    'blood_pressure',
    'heart_rate',
    'weight',
    'height',
    'bmi',
    'foot_examination_notes',
    'skin_examination_notes'
    ];
    public function patient()
    {
        return $this->belongsTo(patient::class);
    }
}
