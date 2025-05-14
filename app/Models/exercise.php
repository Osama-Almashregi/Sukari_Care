<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class exercise extends Model
{
    protected $table = 'exercises';

    protected $primaryKey = 'id';

    protected $fillable = [
        'exercise_name',
        'image_url',
    ];

}
