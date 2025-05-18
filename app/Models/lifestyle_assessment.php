<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class lifestyle_assessment extends Model
{
    protected $table = 'lifestyle_assessment';
    protected $fillable = [
        'physical_activity_level',
        'drug_id',
    ];
    protected $primaryKey = 'id';

    public function patient(){
        return $this->belongsTo(patient::class);
    }
  


}