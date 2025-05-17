<?php

namespace App\Filament\User\Resources\PatientResource\Pages;

use App\Filament\User\Resources\PatientResource;
use App\Models\doctor;
use App\Models\patient;
use App\Models\symptom;
use App\Models\User;
use App\Models\user_profile;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePatient extends CreateRecord
{
    protected static string $resource = PatientResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // تحقق مما إذا كان المريض موجودًا بالفعل
      

        // إنشاء مستخدم جديد
        $user = new User();
        $user->name = $data['user']['name'];
        // ['first_name'] . ' ' . $data['user']['profile']['last_name'];
        $user->email = $data['user']['email'];
        $user->phone = $data['user']['phone'];
        $user->password = bcrypt($data['user']['password']); // تشفير كلمة المرور
        $user->role = 'patient';
        $user->save();



        // // إنشاء ملف تعريف المستخدم
        // $user_profile = new user_profile();
        // $user_profile->first_name = $data['user']['profile']['first_name'];
        // $user_profile->last_name = $data['user']['profile']['last_name'];
        // $user_profile->date_of_birth = $data['user']['profile']['date_of_birth'];
        // $user_profile->contact_info = $data['user']['profile']['contact_info'];
        // $user_profile->user_id = $user->id;
        // $user_profile->save();

        // الحصول على معرف الطبيب من المستخدم المصادق عليه
        $doctor_id = doctor::where('user_id', Auth::user()->id)->first()->id;
        
        $current_patient = patient::where('user_id', $user->id)->first();
        

        // // إضافة user_id و doctor_id إلى مصفوفة البيانات للمريض
        $data['user_id'] = $user->id;
        $data['doctor_id'] = $doctor_id;
        $data['patient_id'] = $current_patient->id;

        //generate patient_id
        $patient =patient::where('user_id', $user->id)->first();

        $symptoms =new symptom();
        $symptoms->symptom_description = $data['symptoms']['symptom_description'];
        $symptoms->severity = $data['symptoms']['severity'];
        $symptoms->save();


        // $data['symptoms'] = implode(',', $symptoms);
        return $data; // يمكنك إرجاع البيانات أو توجيه المستخدم إلى صفحة أخرى
    }
    


}