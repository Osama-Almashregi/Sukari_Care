<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class medical_history extends Model
{
    protected $table = 'medical_history';
protected $fillable=['notes'];
    protected $primaryKey = 'id';
    public $timestamps = true;


}
