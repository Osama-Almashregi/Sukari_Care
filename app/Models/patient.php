<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class patient extends Model
{
    use Notifiable;
    
    protected $table = 'patients';
    protected $fillable=[
        'user_id',
        'doctor_id'
];
    public function user(){
    return $this->belongsTo(User::class);
    }

    public function doctor(){
    return $this->belongsTo(doctor::class);
    }
    public function medical_history(){
        return $this->hasMany(medical_history::class);
    }
    public function symptoms(){
        return $this->hasMany(symptom::class);
    }
    public function physical_examination(){
        return $this->hasMany(physical_examination::class);
    }
    public function blood_tests(){
        return $this->hasMany(blood_test::class);
    }
    public function life_style(){   
        return $this->hasMany(lifestyle_assessment::class);
    }
    public function patient_goles(){
        return $this->hasMany(patient_goal::class);
    }
    public function patient_drug_recommendation(){
        return $this->hasMany(drug_recommendation::class);
    }
    public function patient_meal_recommendation(){
        return $this->hasMany(meal_recommendation::class);
    }
    public function patient_exercise_recommendation(){
        return $this->hasMany(exercise_recommendation::class);
    }
    public function glucose_reading(){
        return $this->hasMany(glucose_reading::class);
    }
    public function relative(){
        return $this->hasMany(relative::class);
    }
 
    
}
