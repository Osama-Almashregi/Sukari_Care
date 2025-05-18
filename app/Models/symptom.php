<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class symptom extends Model
{
    protected $table = 'symptom';
    protected $primaryKey = 'id';
    protected $foreignkey = 'patient_id';
    protected $fillable=[
        'patient_id',
        'severity',
        'symptom_description',
        ];
    public function patient(){
        return $this->belongsTo(patient::class, 'patient_id');
    }
}
