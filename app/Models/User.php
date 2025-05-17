<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;

// class User extends Authenticatable  implements MustVerifyEmail
class User extends Authenticatable 
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;
    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'mobile_otp',
        'image_url',
        'phone',
        'otp',
        'status',
    ];

    protected $hidden = [
        'password',
        'remember_token',

    ];
    protected  $primaryKey = 'id';

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'mobile_last_attempt_date' => 'datetime',
            'mobile_verify_code_send_at' => 'datetime',
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function doctor()
    {
        return $this->hasOne(doctor::class);
    }
    public function profile()
    {
        return $this->hasOne(user_profile::class, 'user_id');
    }
    public function blog()
    {
        return $this->hasMany(blog::class, 'author_id');
    }
    public function comment()
    {
        return $this->hasMany(blog_comment::class);
    }

    public function patient()
    {
        return $this->hasOne(patient::class);
    }
    public function relative()
    {
        return $this->hasOne(relative::class);
    }
}
