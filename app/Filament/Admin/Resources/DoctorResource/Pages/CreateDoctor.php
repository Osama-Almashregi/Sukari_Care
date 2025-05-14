<?php

namespace App\Filament\Admin\Resources\DoctorResource\Pages;

use App\Filament\Admin\Resources\DoctorResource;
use App\Models\User;
use App\Models\user_profile;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateDoctor extends CreateRecord
{
    protected static string $resource = DoctorResource::class;
     protected function mutateFormDataBeforeCreate(array $data): array
    {
        // إنشاء مستخدم جديد
        $user = User::create([
            'name' => $data['user']['profile']['first_name'] . ' ' . $data['user']['profile']['last_name'],
            'email' => $data['user']['email'],
            'phone' => $data['user']['phone'],
            // 'password' => bcrypt($data['user']['password']),
            'role' => 'doctor', // تعيين الدور حسب الحاجة
        ]);

        // إضافة user_id إلى بيانات الطبيب
        
        $user_profile = new user_profile();
        $user_profile->first_name = $data['user']['profile']['first_name'];
        $user_profile->last_name = $data['user']['profile']['last_name'];
        $user_profile->date_of_birth = $data['user']['profile']['date_of_birth'];
        $user_profile->contact_info = $user->phone;
        $user_profile->image_url = $data['user']['profile']['image_url'];
        $user_profile->user_id = $user->id;
        $user_profile->save();
        
        // إزالة بيانات المستخدم من بيانات الطبيب
        $data['user_id'] = $user->id;
        // unset($data['user']);

        return $data;
    }
}
