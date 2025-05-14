<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class glucose_reading extends Model
{
    protected $table = 'glucose_readings';
    protected $primaryKey = 'id';
    public $timestamps = true;
    protected $fillable = [
        'reading_value',
        'reading_type',
    ];
    public function patient(){
        return $this->belongsTo(patient::class, 'patient_id');
    }

}
