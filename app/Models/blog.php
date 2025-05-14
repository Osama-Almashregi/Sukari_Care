<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class blog extends Model
{
    //

    protected $fillable = [
        'author_id',
        'title',
        'slug',
        'content',
        'image_url'
    ];
    protected $primaryKey = 'blog_id';
    protected $foreignKey = 'author_id';

    public function author(){
        return $this->belongsTo(User::class,'author_id');
    }
    public function comments(){
        return $this->hasMany(blog_comment::class,'blog_id');
    }
    public function favorites(){
        return $this->hasMany(Favorite::class,'blog_id');
    }
    
}
