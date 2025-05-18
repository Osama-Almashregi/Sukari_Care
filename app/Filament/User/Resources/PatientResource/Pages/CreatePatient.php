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



        // الحصول على معرف الطبيب من المستخدم المصادق عليه
        $doctor_id = doctor::where('user_id', Auth::user()->id)->first()->id;
        
        

        // // إضافة user_id و doctor_id إلى مصفوفة البيانات للمريض
        $data['user_id'] = $user->id;
        $data['doctor_id'] = $doctor_id;

        //generate patient_id


        // $data['symptoms'] = implode(',', $symptoms);
        return $data; // يمكنك إرجاع البيانات أو توجيه المستخدم إلى صفحة أخرى
    }
protected function afterCreate(): void
{
    // تحقق من وجود الأعراض في البيانات المدخلة
    $symptomsData = $this->record->symptoms; // تأكد من أن لديك الأعراض هنا

    // تحقق من وجود أعراض
    if (!empty($symptomsData)) {
        foreach ($symptomsData as $symptom) {
            $this->record->symptoms()->create([
                'patient_id' => $this->record->id,
                'symptom_description' => $symptom['symptom_description'], // تأكد من استخدام المصفوفة
                'severity' => $symptom['severity'], // تأكد من استخدام المصفوفة
            ]);
        }
    }
}
}