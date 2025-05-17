<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\user_profile;
use App\Models\UserProfile;
use Illuminate\Database\Eloquent\Factories\Factory;

class user_profile_factoryFactory extends Factory
{
    protected $model = user_profile::class;

    public function definition()
    {
        return [
            'user_id' => User::factory(), // إنشاء مستخدم عشوائي
            'first_name' => $this->faker->firstName,
            'last_name' => $this->faker->lastName,
            'date_of_birth' => $this->faker->date(),
            'gender' => $this->faker->randomElement(['male', 'female']),
            'contact_info' => $this->faker->phoneNumber,
            'image_url' => $this->faker->imageUrl(),
        ];
    }
}