<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class meal_system extends Model
{
    protected $table = 'meal_systems';
    protected $primaryKey = 'id';

    protected $fillable = [
        'name',
        'patient_id',
        'image_url',
        'meal_setup',
    ];
    public function patient()
    {
        return $this->belongsTo(patient::class, 'patient_id');
    }
}
