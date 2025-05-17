<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\user_profile as UserProfile;

class user_profile extends Seeder
{
    public function run()
    {
        UserProfile::factory()->count(10)->create(); // إنشاء 10 ملفات تعريف مستخدم عشوائية
    }
}