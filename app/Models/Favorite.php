<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Favorite extends Model
{
    protected $table = 'favorites';
    protected $primaryKey = 'id';
    protected $fillable = ['user_id', 'blog_id'];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function blog()
    {
        return $this->belongsTo(blog::class,'blog_id');
    }
 
}
