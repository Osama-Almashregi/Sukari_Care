<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class drug extends Model
{
    protected $table = 'drugs';
    protected $primaryKey = 'id';
    protected $fillable = [
        'drug_name',
        'drug_type',
    ];
   
}
