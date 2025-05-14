<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class alarm extends Model
{
    protected $table = 'alarms';

    protected $fillable = [
        'patient_id',
        'title',
        'time',
        'repeat',
        'is_active',
    ];
    public $timestamps = true;
    //for is_active boolean

    public function patient()
    {
        return $this->belongsTo(patient::class, 'patient_id');
    }
}
