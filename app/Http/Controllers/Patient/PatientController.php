<?php

namespace App\Http\Controllers\Patient;

use App\Http\Controllers\Controller;
use App\Models\alarm;
use App\Models\drug;
use App\Models\drug_recommendation;
use App\Models\exercise_recommendation;
use App\Models\glucose_reading;
use App\Models\meal_recommendation;
use App\Models\meal_system;
use App\Models\patient;
use App\Models\relative;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PatientController extends Controller
{
    public function index() {}

        public function getNotifications()
    {
        // فرضًا أنك حصلت على المريض الحالي
        // $patient->id = Patient::find(32); // أو حسب طريقة استرجاع المستخدم
        //get user id from patient id

        $user = Auth::user();
        $notifications = $user->notifications;
        foreach ($notifications as $notification) {
            $notification->markAsRead();
        }
        if ($notifications->count() == 0) {
            return response()->json('there is no notifications for dear you '.$user->name, 404);
        }
        $notifications = $notifications->map(function ($notification) {
            return [
                'title' => $notification->data['title'],
                'data' => $notification->data['data'],
                'created_at' => $notification->created_at,
                
            ];
        });
        return response()->json($notifications, 200);
    }
    public function get_alarms(Request $request)
    {
        $patient = patient::where('user_id', Auth::user()->id)->first();
        $alarms = alarm::where('patient_id', $patient->id)->get();
        $patient = $alarms->map(function ($alarm) {
            if ($alarm->is_active == 1) {
                $alarm->is_active = true;
            } else {
                $alarm->is_active = false;
            }
            return [
                'id' => $alarm->id,
                'title' => $alarm->title,
                'time' => $alarm->time,
                'date' => $alarm->date,
                'repeat' => $alarm->repeat,
                'is_active' => $alarm->is_active
            ];
        });
        return response()->json($patient, 200);
    }

    public function add_alarm(Request $request)
    {

        try {

            $request->validate([
                'title' => 'required',
                'time' => 'required',
                'repeat' => 'required',
                'is_active' => 'required',
                'date' => 'required',

            ]);

            $patient = patient::where('user_id', Auth::user()->id)->first();
            $alarm = new alarm();
            $alarm->patient_id = $patient->id;
            $alarm->title = $request->title;
            $alarm->time = $request->time;
            $alarm->date = $request->date;
            $alarm->repeat = $request->repeat;
            if ($request->is_active == 'true') {
                $alarm->is_active = 1;
            } else if ($request->is_active == 'false') {
                $alarm->is_active = 0;
            }
            $alarm->save();
            return response()->json([
                // 'message' => 'Alarm added successfully',
                'id' => $alarm->id,
                'title' => $alarm->title,
                'time' => $alarm->time,
                'date' => $alarm->date,
                'repeat' => $alarm->repeat,
                'is_active' => $request->is_active

            ], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to add alarm'], 500);
        }
    }
    public function delete_alarm(Request $request)
    {
        try {
            $patient = patient::where('user_id', Auth::user()->id)->first();
            $alarm = alarm::where('patient_id', $patient->id)->where('id', $request->id)->first();
            $alarm->delete();
            return response()->json(['message' => 'Alarm deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to delete alarm'], 500);
        }
    }
    //today update
    public function add_meal_system(Request $request)
    {
        

        // التأكد من أن البيانات المرسلة عبارة عن مصفوفة من الوجبات
        $meals = $request->input('diets');

        foreach ($meals as $mealData) {
            $patient = patient::where('user_id', Auth::user()->id)->first();
            $meal_system = new meal_system();
            $meal_system->patient_id = $patient->id;
            $meal_system->meal_name = $mealData['meal_name'];
            $meal_system->meal_time = $mealData['meal_time'];
            $meal_system->meal_setup = $mealData['meal_setup'];

            if (isset($mealData['image_url'])) {
                // إذا كانت الصورة موجودة، يمكنك استخدام URL مباشرة أو معالجة الصورة
                // هنا سأفترض أن الصورة تم تحميلها مسبقًا
                $meal_system->image_url = $mealData['image_url'];
            }

            $meal_system->save();
        }

        return response()->json(['message' => 'Meal systems added successfully'], 200);
    }



    public function get_statistics(Request $request)
    {
        // i need to get the large glucose reading throughout the week
        $patient = patient::where('user_id', Auth::user()->id)->first();
        // $glucose_reading = glucose_reading::where('patient_id', $patient->id)->orderBy('reading_value', 'desc')->first();
        //جلب المتوسط  للقراءات 
        $reading_average = glucose_reading::where('patient_id', $patient->id)->avg('reading_value');
        $reading_max = glucose_reading::where('patient_id', $patient->id)->max('reading_value');
        // $reading_min = glucose_reading::where('patient_id', $patient->id)->min('reading_value')-;
        $reading_count = glucose_reading::where('patient_id', $patient->id)->count();
        return response()->json(['reading_count' => $reading_count, 'reading_average' => $reading_average, 'reading_max' => $reading_max], 200);
    }

    //today update 

    public function patient_info(Request $request)
    {
        $patient_info = patient::where('id', $request->id)
            ->with('glucose_reading')
            ->with('user')
            ->with('user.profile')
            ->with('symptoms')
            ->with('medical_history')
            ->with('physical_examgination')
            ->with('blood_tests')
            ->with('life_style')
            ->with('patient_goles')
            ->with('patient_drug_recommendation')
            ->with('patient_drug_recommendation.drug')
            ->with('patient_meal_recommendation')
            ->with('patient_meal_recommendation.meal')
            ->with('patient_exercise_recommendation')
            ->with('patient_exercise_recommendation.exercise')
            ->with('doctor.user.profile')
            // ->with('')
            ->get();


        return response()->json($patient_info, 200);
    }
    public function update_User(Request $request)
    {
        try {
            $user_id = Auth::user()->id;
            $user = User::find($user_id);
            $user->update([
                'name' => $request->name,
                'phone' => $request->phone,
                'password' => bcrypt($request->password)
            ]);
            return response()->json(['message' => 'Patient profile updated successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to update patient profile'], 500);
        }
        // $id = $request->patient_id;
        // // dd($request->all());
        // $patient = patient::find($id);
        // $patient->user->update([
        //     'name' => $request->name,
        //     'email' => $request->email,
        //     'password' => bcrypt($request->password),
        // ]);
        // if ($request->hasFile('image_url')) {
        //     $file = $request->file('image_url');
        //     $fileExtension = $request->file('image_url')->extension();
        //     $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
        //     $file->move(public_path('uploads/doctors'), $file_name);
        //     $patient->user->profile()->update([
        //         'image_url' => $file_name,
        //     ]);
        // }

        // $patient->user->profile()->update([
        //     'first_name' => $request->first_name,
        //     'last_name' => $request->last_name,
        //     'date_of_birth' => $request->date_of_birth,
        //     'contact_info' => $request->contact_info,
        // ]);

        // return response()->json(['message' => 'Profile updated successfully'], 200);
    }

    public function Add_glucose_reading(Request $request)
    {
        $patient = patient::where('user_id', Auth::user()->id)->first();

        // dd($request->all());
        $patient->glucose_reading()->create([
            'patient_id' => $patient->id,
            'reading_value' => $request->reading_value,
            'reading_type' => $request->reading_info,
        ]);
        return response()->json(['message' => 'Glucose reading added successfully'], 200);
    }
    public function get_patients_readings(Request $request)
    {
        $patient = patient::where('user_id', Auth::user()->id)->first();
        $patients = glucose_reading::where('patient_id', $patient->id)->get();

        if ($patients->isEmpty()) {
            return response()->json(['message' => 'لا يوجد قراءات'], 200);
        }

        // مصفوفة لتحويل أسماء الأيام إلى العربية
        $daysInArabic = [
            'Sunday' => 'الأحد',
            'Monday' => 'الاثنين',
            'Tuesday' => 'الثلاثاء',
            'Wednesday' => 'الأربعاء',
            'Thursday' => 'الخميس',
            'Friday' => 'الجمعة',
            'Saturday' => 'السبت',
        ];

        $patients = $patients->map(function ($reading) use ($daysInArabic) {
            // تحويل اليوم إلى اسم عربي
            $dayInEnglish = $reading->created_at->format('l');
            $dayInArabic = $daysInArabic[$dayInEnglish] ?? $dayInEnglish;

            return [
                'reading_value' => $reading->reading_value,
                'reading_info' => $reading->reading_type,
                'date' => $reading->created_at->format('Y-m-d'),
                'time' => $reading->created_at->format('h:i:s A'),
                // عرض اليوم بالكلمات العربية
                'day' => $dayInArabic,
            ];
        });

        return response()->json($patients, 200);
    }
    public function get_meal_recommendation(Request $request)
    {

        $patient = patient::where(('user_id'), Auth::user()->id)->first();
        $patients = meal_recommendation::where('patient_id', $patient->id)->with('meal')->get();
        if ($patients->isEmpty()) {
            return response()->json(['message' => 'لا يوجد وصفات غذائية'], 200);
        }
        $patient = $patients->map(function ($patient) {
            return [
                'meal_name' => $patient->meal->meal_name,
                'meal_setup' =>  $patient->meal_setup,
                'meal_time' => $patient->meal_time,

            ];
        });
        return response()->json($patient, 200);
    }
    public function get_exercise_recommendation(Request $request)
    {
        $patient = patient::where(('user_id'), Auth::user()->id)->first();
        $patients = exercise_recommendation::where('patient_id', $patient->id)->with('exercise')->get();
        if ($patients->isEmpty()) {
            return response()->json(['message' => 'لا يوجد وصفات تمارين'], 200);
        }
        $patient = $patients->map(function ($patient) {
            return [
                'exercise_name' => $patient->exercise->exercise_name,
                'exercise_description' =>  $patient->exercise_description,
                // 'image_url' => $patient->exercise->image_url,


            ];
        });
        if ($patient->isEmpty()) {
            return response()->json(['message' => 'لا يوجد وصفات تمارين'], 200);
        }
        return response()->json($patient, 200);
    }
    public function get_drug_recommendation(Request $request)
    {
        $patient = patient::where(('user_id'), Auth::user()->id)->first();
        $patients = drug_recommendation::where('patient_id', $patient->id)->with('drug')->get();
        if ($patients->isEmpty()) {
            return response()->json(['message' => 'لا يوجد وصفات علاجية'], 200);
        }
        $patient = $patients->map(function ($patient) {
            return [
                'drug_name' => $patient->drug->drog_name,
                'when_to_take' =>  $patient->when_to_take,
                'time_to_take' => $patient->time_to_take,
                'number_of_takes' => $patient->number_of_takes,
                // 'image_url' => $patient->drug->image_url,
                'drug_type' => $patient->drug->drug_type,

            ];
        });
        if ($patient->isEmpty()) {
            return response()->json(['message' => 'لا يوجد وصفات علاجية'], 200);
        }
        return response()->json($patient, 200);
    }
    public function add_relative(Request $request)
    {
        try {
            $rundom = random_int(100000, 999999);
            $user = new User();
            $user->name = $request->name;
            $user->phone = $request->phone;
            $user->role = 'relative';
            $user->email = $request->name . $rundom . '@gmail.coms';
            $user->image_url = $request->image_url;
            if ($request->hasFile('image_url')) {
                $file = $request->file('image_url');
                $fileExtension = $request->file('image_url')->extension();
                $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
                $file->move(public_path('uploads/user_profile'), $file_name);
                $user->image_url = $file_name;
            }
            $user->password = bcrypt($request->password);
            $user->save();
            $user_id = $user->id;
            $patient = patient::where('user_id', $request->user_id)->first();
            $relative = new relative();
            $relative->patient_id = $patient->id;
            $relative->user_id = $user_id;
            $relative->save();
            return response()->json(['message' => 'Relative added successfully'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => $th],);
        }
    }
    public function get_relative(Request $request)
    {
        $patients =  patient::with('user')->with('user.profile')->with('relative.user.profile')->where('id', $request->id)->get();
        return response()->json($patients, 200);
    }
    // update relative patient
    public function update_relative(Request $request)
    {
        $id = $request->id;
        // dd($request->all());
        $relative = relative::find($id);
        $relative->user->update([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);
        $relative->user->profile()->update([
            'contact_info' => $request->contact_info,
        ]);
        return response()->json(['message' => 'Relative updated successfully'], 200);
    }
    public function add_blood_test(Request $request)
    {
        $patient = patient::find($request->patient_id);

        if ($request->hasFile('attachment')) {
            $file = $request->file('attachment');
            $fileExtension = $request->file('attachment')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/patients/blood_tests'), $file_name);
            $patient->blood_tests()->create([
                'patient_id' => $patient->patient_id,
                'result' => $request->result,
                'test_type' => $request->test_type,
                'attachment' => $file_name,
            ]);
        } else {
            $patient->blood_tests()->create([
                'patient_id' => $patient->patient_id,
                'result' => $request->result,
                'test_type' => $request->test_type,
            ]);
        }
        return response()->json(['message' => 'Blood test added successfully'], 200);
    }
}
