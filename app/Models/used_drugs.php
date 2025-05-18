<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class used_drugs extends Model
{
    protected $table = 'used_drugs';
    protected $primaryKey = 'id';
      protected $foreignkey = 'patient_id';

    protected $fillable = [
        'patient_id',
        'drug_name',
    ];

    public function patient(){
        return $this->belongsTo(patient::class,'patient_id');
    }
  
}
