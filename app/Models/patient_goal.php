<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class patient_goal extends Model
{
    
    protected $table = 'patient_goals';

    protected $fillable = [
        'goal_description',
        'goal_status',
        'target_date',
    ];
    protected $primaryKey = 'id';
    protected $foreignKey = 'patient_id';

}
