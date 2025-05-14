<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class symptom extends Model
{
    protected $table = 'symptoms';
    protected $primaryKey = 'id';
    protected $foreignkey = 'patient_id';
    protected $fillable=[
        'severity',
        'symptom_description'
        ];
    public function patient(){
        return $this->belongsTo(patient::class);
    }
}
