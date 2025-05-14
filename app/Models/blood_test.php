<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class blood_test extends Model
{
    protected $table = 'blood_tests';
    protected $primaryKey = 'id';
    protected $foreignkey='patient_id';
    protected $fillable = [ 'attachment', 'test_type', 'result'];

}
