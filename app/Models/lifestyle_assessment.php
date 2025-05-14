<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class lifestyle_assessment extends Model
{
    protected $table = 'lifestyle_assessment';
    protected $fillable = [
        'medications',
        'physical_activity_level',
        'dietary_habits',
    ];
    protected $primaryKey = 'id';


}