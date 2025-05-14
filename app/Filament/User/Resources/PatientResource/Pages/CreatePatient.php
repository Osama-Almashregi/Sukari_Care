<?php

namespace App\Filament\User\Resources\PatientResource\Pages;

use App\Filament\User\Resources\PatientResource;
use App\Models\User;
use App\Models\user_profile;
use App\Models\UserProfile;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePatient extends CreateRecord
{
    protected static string $resource = PatientResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Create new user
        $user = new User();
        $user->name = $data['user']['profile']['first_name'] . ' ' . $data['user']['profile']['last_name'];
        $user->email = $data['user']['email'];
        $user->phone = $data['user']['phone'];
        $user->password =$data['user']['password'];
        $user->role = 'patient';
        $user->save();

        // Create user profile
        $user_profile = new user_profile();
        $user_profile->first_name = $data['user']['profile']['first_name'];
        $user_profile->last_name = $data['user']['profile']['last_name'];
        $user_profile->date_of_birth = $data['user']['profile']['date_of_birth'];
        $user_profile->contact_info = $data['user']['profile']['contact_info'];
        // $user_profile->image_url = $data['user']['profile']['image_url'];
        $user_profile->user_id = $user->id;
        $user_profile->save();

        // Get the doctor ID from the authenticated user
        $doctor_id = Auth::user()->id;

        // Add user_id and doctor_id to the data array
        $data['user_id'] = $user->id;
        $data['doctor_id'] = $doctor_id;

        return $data;
    }
}