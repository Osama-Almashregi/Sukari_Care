<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class blog_comment extends Model
{
    protected $fillable=[
        'blog_id',
        'comment',
        'user_id',

    ];
    protected $primaryKey = 'comment_id';
    public function blog(){
        return $this->belongsTo(blog::class,'blog_id');
    }
    public function author(){
        return $this->belongsTo(User::class,'user_id');
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
    
    
}
