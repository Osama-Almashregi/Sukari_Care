<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class meal extends Model
{
    protected $table = 'meals';
    protected $primaryKey = 'id';
    protected $fillable = [
        'meal_name',
        'meal_description',
        'calories',
        'image_url',
    ];
    
}
