<?php

namespace App\Http\Controllers\Doctor;

use App\Models\exercise_recommendation;
use App\Models\Favorite;
use App\Models\meal_recommendation;
use App\Notifications\DoctorNewRecommandationNotfication;
use GuzzleHttp\Psr7\Response;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Controller;
use App\Models\blog;
use App\Models\blog_comment;
use App\Models\doctor;
use App\Models\drug;
use App\Models\drug_recommendation;
use App\Models\exercise;
use App\Models\lifestyle_assessment;
use App\Models\meal;
use App\Models\patient;
use App\Models\User;
use App\Notifications\DoctorNewDrugRecommandationNotfication;
use App\Notifications\DoctorNewExerciseRecommandationNotfication;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Auth as FacadesAuth;
use Illuminate\Support\Facades\Notification as FacadesNotification;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Intervention\Image\Laravel\Facades\Image;


class DoctorController extends Controller
{
    public function index()
    {
    }
    
    public function add_p(Request $request)
    {
        // dd($request->all());

    //     // return response()->json($request->all(),200);
        $user = new User();
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->email = $request->name.'@gmail.com';
        $user->password = bcrypt($request->name); // استخدم bcrypt لتشفير كلمة المرور
        $user->role = 'patient';
        $user->save(); // حفظ المستخدم أولاً

        // توليد user_id بعد حفظ المستخدم
        $userId = $user->id;
        $doctor_id = doctor::where('user_id', Auth::user()->id)->first()->id;

        $user->patient()->create([
            'user_id' => $userId,
            'doctor_id' => $doctor_id,
            'type_of_sugar'=>$request->type_of_sugar
        ]);
        if ($request->hasFile('image_url')) {
            $file = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/patients'), $file_name);
           $user->profile()->create([
            'user_id' => $userId,
            'first_name' => $request->name,
            'last_name' => $request->name,
            'date_of_birth' => $request->date_of_birth,
            'contact_info' => $request->phone,
            'gender' => $request->gender,
            'image_url' => $request->image_url
        ]);
        }
        else{
            $user->profile()->create([
            'user_id' => $userId,
            'first_name' => $request->name,
            'last_name' => $request->name,
            'date_of_birth' => $request->date_of_birth,
            'contact_info' => $request->phone,
            'gender' => $request->gender,
        ]);
    }
    
    
    $patient_id = $user->patient->id;
    
    $patient = patient::find($patient_id);
    $patient->medical_history()->create([
        'notes' => $request->medical_diagnosis,
    ]);

        $patient->symptoms()->create([
            'symptom_description' => $request->symptom_description,
            'severity' => $request->symptom_severity,
            // 'duration' => $request->duration,
        ]);

    
        if($request->hasFile('foot_exam_file_name')){
            $file_foot = $request->file('foot_exam_file_name');
            $fileExtension_foot = $request->file('foot_exam_file_name')->extension();
            $file_name_foot = Carbon::now()->timestamp . '.' . $fileExtension_foot;
            $file_foot->move(public_path('uploads/patients/foot_examination'), $file_name_foot);
             $patient->physical_examination()->create([
            'blood_pressure' => $request->blood_pressure,
            'heart_rate' => $request->heart_rate,
            'weight' => $request->weight,
            'height' => $request->height,
            'bmi' => $request->bmi,
            'foot_examination_notes' => $file_foot
            ]);
        }
        else{
            $patient->physical_examination()->create([
            'blood_pressure' => $request->blood_pressure,
            'heart_rate' => $request->heart_rate,
            'weight' => $request->weight,
            'height' => $request->height,
            'bmi' => $request->bmi,
            'foot_examination_notes' => $request->foot_exam_file_name
            ]);
        }
        
        // $patient->blood_tests()->create([
        //     'patient_id' => $patient_id,
        //     'result' => $request->result,
        //     'test_type' => $request->test_type,
        //     'attachment' => $request->attachment,
        // ]);
        // $patient->life_style()->create([
        //     'physical_activity_level' => $request->physical_activity_level,

        //     // ------------------------------------------------------------
        //     'medications' => json_encode(['sihsoi', 'shoid']),
        //     // ------------------------------------------------------------
        // ]);
        // $patient->patient_goles()->create([
        //     'goal_status' => $request->goal_status,
        //     'target_date' => $request->target_date,
        //     'goal_description' => $request->goal_description
        // ]);
        // //   array of drugs recommendation
        // $drugsData = [
        //     [
        //         'drug_name' => 'Paracetamol',
        //         'drug_type' => 'pills',
        //         'when_to_take' => 'after_meal',
        //         'time_to_take' => 'morning',
        //         'number_of_takes' => '2',
        //         'image_url' => 'http://example.com/image1.png',
        //     ],
        //     [
        //         'drug_name' => 'Amoxicillin',
        //         'drug_type' => 'pills',
        //         'when_to_take' => 'before_meal',
        //         'time_to_take' => 'evening',
        //         'number_of_takes' => '1',
        //         'image_url' => 'http://example.com/image2.png',
        //     ],
        // ];
        // foreach ($drugsData as $key => $value) {
        //     $drug = new drug();
        //     $drug->drog_name = $value['drug_name'];
        //     $drug->drug_type = $value['drug_type'];
        //     $drug->save();

        //     $patient->patient_drug_recommendation()->create([
        //         'drug_id' => $drug->id,
        //         'when_to_take' => $value['when_to_take'],
        //         'time_to_take' => $value['time_to_take'],
        //         'number_of_takes' => $value['number_of_takes'],
        //         'image_url' => $value['image_url']
        //     ]);
        // }
        // $mealsData = [
        //     [
        //         'meal_name' => 'Breakfast',
        //         'meal_description' => 'A healthy breakfast 200',
        //         'calories' => '200',
        //         'image_url' => 'http://example.com/breakfast.png',
        //     ],
        //     [
        //         'meal_name' => 'Lunch',
        //         'meal_description' => 'A healthy lunch 300',
        //         'calories' => '300',
        //         'image_url' => 'http://example.com/lunch.png',

        //     ],
        // ];
        // foreach ($mealsData as $key => $value) {
        //     $meal = new meal();
        //     $meal->meal_name = $value['meal_name'];
        //     $meal->calories = $value['calories'];
        //     $meal->image_url = $value['image_url'];
        //     $meal->save();
        //     $patient->patient_meal_recommendation()->create([
        //         'meal_id' => $meal->id,
        //         'meal_description' => $value['meal_description'],
        //     ]);
        // }
        // $exercisesData = [
        //     [
        //         'exercise_name' => 'Push-ups',
        //         'exercise_description' => 'try to do 10 push-ups',
        //         'image_url' => 'http://example.com/pushups.png',
        //     ],
        //     [
        //         'exercise_name' => 'Squats',
        //         'exercise_description' => 'try to do 10 squats',
        //         'image_url' => 'http://example.com/squats.png',
        //     ]
        // ];
        // foreach ($exercisesData as $key => $value) {
        //     $exercise = new exercise();
        //     $exercise->exercise_name = $value['exercise_name'];
        //     $exercise->image_url = $value['image_url'];
        //     $exercise->save();
        //     $patient->patient_exercise_recommendation()->create([
        //         'exercise_id' => $exercise->id,
        //         'exercise_description' => $value['exercise_description'],
        //     ]);
        // }



        return response()->json('Patient created successfully', 200);
    }
    public function deleteFavorite(Request $request)
    {
        $blog_id = $request->blog_id;
        Favorite::where('user_id', Auth::user()->id)->where('blog_id', $blog_id)->delete();
        return response()->json('Favorite deleted successfully', 200);
    }
    public function get_favorites()
    {
        $favorites = Favorite::where('user_id', Auth::user()->id)->get();
        if (count($favorites) == 0) {
            return response()->json(['message' => 'No favorites found'], 200);
        }
        return response()->json($favorites, 200);
    }
    public function add_favorite(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'blog_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $favorite = new Favorite();
        $favorite->user_id = Auth::user()->id;
        $favorite->blog_id = $request->blog_id;
        $favorite->save();
        return response()->json('Favorite added successfully', 200);
    }
    public function getAllDoctors()
    {
        $doctors = doctor::with('user')->with('user.profile')->get();
        $result = $doctors->map(function ($doctor) {
            return [
                'id' => $doctor->id,
                'name' => $doctor->user ? $doctor->user->name : null,
                // 'phone' => $doctor->user ? $doctor->user->phone : null,
                'first_name' => $doctor->user && $doctor->user->profile ? $doctor->user->profile->first_name : null,
                'last_name' => $doctor->user && $doctor->user->profile ? $doctor->user->profile->last_name : null,
                'email' => $doctor->user ? $doctor->user->email : null,
            ];
        });
        return response()->json($result, 200);
    }

    public function getDoctor(Request $request)
    {
        $id = $request->id;
        $doctors = doctor::with('user')->with('user.profile')->where('id', $id)->get();
        $result = $doctors->map(function ($doctor) {
            return [
                'doctor_id' => $doctor->id,
                'name' => $doctor->user ? $doctor->user->name : null,
                'first_name' => $doctor->user && $doctor->user->profile ? $doctor->user->profile->first_name : null,
                'last_name' => $doctor->user && $doctor->user->profile ? $doctor->user->profile->last_name : null,
                'email' => $doctor->user ? $doctor->user->email : null,
            ];
        });
        return response()->json($result, 200);
    }
    public function update_Doctor_profile(Request $request)
    {
        // return response()->json($request->all(),200);
        $id = $request->id;
        $doctor = doctor::find($id);
        $doctor->user->update([
            'password' => bcrypt($request->password),
        ]);
        if ($request->hasFile('image_url')) {
            $file = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/doctors'), $file_name);
            $doctor->user->profile()->update([
                'image_url' => $file_name,
            ]);
        }
        $doctor->user->profile()->update([
            'date_of_birth' => $request->date_of_birth,
            'contact_info' => $request->contact_info,
        ]);
        return response()->json(['message' => 'Profile updated successfully'], 200);
    }

    // public function addLifeStyle(Request $request){
    //     $drugs=drug::all();
    //     $drugs = json_encode($drugs);

    //     $lifestyle = new lifestyle_assessment();
    //     $lifestyle->patient_id = $request->patient_id;
    //     $lifestyle->physical_activity_level = $request->physical_activity_level;
    //     $lifestyle->medications =$drugs;
    //     $lifestyle->save();

    // }
    // public function getlifeStyle(Request $request){

    //     $lifestyle = lifestyle_assessment::get('medications');
    //     // $lifestyleJson = json_decode($lifestyle);
    //     // dd($request->all());

    //     return response()->json($lifestyle,200);
    // }


    public function add_patient(Request $request)
    {

        // return response()->json($request->all(),200);
        $user = new User();
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->email = $request->name.'@gmail.com';
        $user->password = bcrypt($request->name); // استخدم bcrypt لتشفير كلمة المرور
        $user->role = 'patient';
        $user->save(); // حفظ المستخدم أولاً

        // توليد user_id بعد حفظ المستخدم
        $userId = $user->id;
        $doctor_id = doctor::where('user_id', Auth::user()->id)->first()->id;

        $user->patient()->create([
            'user_id' => $userId,
            'doctor_id' => $doctor_id,
            'type_of_sugar'=>$request->type_of_sugar
        ]);
        if ($request->hasFile('image_url')) {
            $file = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/patients'), $file_name);
           $user->profile()->create([
            'user_id' => $userId,
            'first_name' => $request->name,
            'last_name' => $request->name,
            'date_of_birth' => $request->date_of_birth,
            'contact_info' => $request->phone,
            'gender' => $request->gender,
            'image_url' => $request->image_url
        ]);
        }
        else{
            $user->profile()->create([
            'user_id' => $userId,
            'first_name' => $request->name,
            'last_name' => $request->name,
            'date_of_birth' => $request->date_of_birth,
            'contact_info' => $request->phone,
            'gender' => $request->gender,
        ]);
    }
    
    
    $patient_id = $user->patient->id;
    
    $patient = patient::find($patient_id);
    $patient->medical_history()->create([
        'notes' => $request->medical_diagnosis,
    ]);

        // $patient->symptoms()->create([
        //     'patient_id' => $patient_id,
        //     'symptom_description' => $request->symptom_description,
        //     'severity' => $request->severity,
        //     // 'duration' => $request->duration,
        // ]);

        // $patient->physical_examination()->create([
        //     'patient_id' => $patient_id,
        //     'blood_pressure' => $request->blood_pressure,
        //     'heart_rate' => $request->heart_rate,
        //     'weight' => $request->weight,
        //     'height' => $request->height,
        //     'bmi' => $request->bmi,
        //     'foot_examination_notes' => $request->foot_examination,
        //     'skin_examination_notes' => $request->skin_examination,
        // ]);
        // $patient->blood_tests()->create([
        //     'patient_id' => $patient_id,
        //     'result' => $request->result,
        //     'test_type' => $request->test_type,
        //     'attachment' => $request->attachment,
        // ]);
        // $patient->life_style()->create([
        //     'physical_activity_level' => $request->physical_activity_level,

        //     // ------------------------------------------------------------
        //     'medications' => json_encode(['sihsoi', 'shoid']),
        //     // ------------------------------------------------------------
        // ]);
        // $patient->patient_goles()->create([
        //     'goal_status' => $request->goal_status,
        //     'target_date' => $request->target_date,
        //     'goal_description' => $request->goal_description
        // ]);
        // //   array of drugs recommendation
        // $drugsData = [
        //     [
        //         'drug_name' => 'Paracetamol',
        //         'drug_type' => 'pills',
        //         'when_to_take' => 'after_meal',
        //         'time_to_take' => 'morning',
        //         'number_of_takes' => '2',
        //         'image_url' => 'http://example.com/image1.png',
        //     ],
        //     [
        //         'drug_name' => 'Amoxicillin',
        //         'drug_type' => 'pills',
        //         'when_to_take' => 'before_meal',
        //         'time_to_take' => 'evening',
        //         'number_of_takes' => '1',
        //         'image_url' => 'http://example.com/image2.png',
        //     ],
        // ];
        // foreach ($drugsData as $key => $value) {
        //     $drug = new drug();
        //     $drug->drog_name = $value['drug_name'];
        //     $drug->drug_type = $value['drug_type'];
        //     $drug->save();

        //     $patient->patient_drug_recommendation()->create([
        //         'drug_id' => $drug->id,
        //         'when_to_take' => $value['when_to_take'],
        //         'time_to_take' => $value['time_to_take'],
        //         'number_of_takes' => $value['number_of_takes'],
        //         'image_url' => $value['image_url']
        //     ]);
        // }
        // $mealsData = [
        //     [
        //         'meal_name' => 'Breakfast',
        //         'meal_description' => 'A healthy breakfast 200',
        //         'calories' => '200',
        //         'image_url' => 'http://example.com/breakfast.png',
        //     ],
        //     [
        //         'meal_name' => 'Lunch',
        //         'meal_description' => 'A healthy lunch 300',
        //         'calories' => '300',
        //         'image_url' => 'http://example.com/lunch.png',

        //     ],
        // ];
        // foreach ($mealsData as $key => $value) {
        //     $meal = new meal();
        //     $meal->meal_name = $value['meal_name'];
        //     $meal->calories = $value['calories'];
        //     $meal->image_url = $value['image_url'];
        //     $meal->save();
        //     $patient->patient_meal_recommendation()->create([
        //         'meal_id' => $meal->id,
        //         'meal_description' => $value['meal_description'],
        //     ]);
        // }
        // $exercisesData = [
        //     [
        //         'exercise_name' => 'Push-ups',
        //         'exercise_description' => 'try to do 10 push-ups',
        //         'image_url' => 'http://example.com/pushups.png',
        //     ],
        //     [
        //         'exercise_name' => 'Squats',
        //         'exercise_description' => 'try to do 10 squats',
        //         'image_url' => 'http://example.com/squats.png',
        //     ]
        // ];
        // foreach ($exercisesData as $key => $value) {
        //     $exercise = new exercise();
        //     $exercise->exercise_name = $value['exercise_name'];
        //     $exercise->image_url = $value['image_url'];
        //     $exercise->save();
        //     $patient->patient_exercise_recommendation()->create([
        //         'exercise_id' => $exercise->id,
        //         'exercise_description' => $value['exercise_description'],
        //     ]);
        // }



        return response()->json('Patient created successfully', 200);
    }
    public function getDrugs()
    {
        $drug = drug::all();
        $drugs = json_encode($drug);
        return response()->json($drugs, 200);
    }
    public function getPatients(Request $request)
    {

        $doctor_id = $request->doctor_id;
        $patients = patient::with('user')->with('user.profile')->where('doctor_id', $doctor_id)->get();
        $result = $patients->map(function ($patient) {
            return [
                'patient_id' => $patient->id,
                'doctor_name' => $patient->doctor && $patient->doctor->user && $patient->doctor->user->profile ? $patient->doctor->user->profile->first_name . ' ' . $patient->doctor->user->profile->last_name : null,
                'patient_first_name' => $patient->user && $patient->user->profile ? $patient->user->profile->first_name : null,
                'patient_last_name' => $patient->user && $patient->user->profile ? $patient->user->profile->last_name : null,
                'patient_email' => $patient->user ? $patient->user->email : null,
            ];
        });
        return response()->json($result, 200);
    }
    public function getPatient(Request $request)
    {
        $id = $request->id;
        $patients = patient::with('user')
            ->with('user.profile')
            ->with('symptoms')
            ->with('medical_history')
            ->with('physical_examination')
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
            ->where('id', $id)->get();
        if ($patients->count() == 0) {
            $message = 'Patient not found';
            return response()->json(['message' => $message], 200);
        } else {
            $result = $patients->map(function ($patient) {
                return [
                    'patient_id' => $patient->id,
                    'patient_first_name' => $patient->user && $patient->user->profile ? $patient->user->profile->first_name : null,
                    'patient_last_name' => $patient->user && $patient->user->profile ? $patient->user->profile->last_name : null,
                    'patient_email' => $patient->user ? $patient->user->email : null,
                    'patient_contact_info' => $patient->user ? $patient->user->profile->contact_info : null,
                    'patient_date_of_birth' => $patient->user ? $patient->user->profile->date_of_birth : null,
                    'patient_image_url' => $patient->user ? $patient->user->profile->image_url : null,
                    'patient_symptoms' => $patient->symptoms ? $patient->symptoms->map(function ($symptom) {
                        return [
                            'id' => $symptom->id,
                            'symptom_description' => $symptom->symptom_description,
                            'severity' => $symptom->severity,
                            // 'duration' => $symptom->duration,
                        ];
                    }) : null,
                    'blood_tests' => $patient->blood_tests ? $patient->blood_tests->map(function ($blood_test) {
                        return [
                            'id' => $blood_test->id,
                            'attachment' => $blood_test->attachment,

                            'test_type' => $blood_test->test_type,
                            'result' => $blood_test->result,
                            // 'duration' => $symptom->duration,
                        ];
                    }) : null,
                    'blood_tests' => $patient->blood_tests ? $patient->blood_tests->map(function ($blood_test) {
                        return [
                            'id' => $blood_test->id,
                            'attachment' => $blood_test->attachment,

                            'test_type' => $blood_test->test_type,
                            'result' => $blood_test->result,
                            // 'duration' => $symptom->duration,
                        ];
                    }) : null,
                ];
            });
            return response()->json($patients, 200);
        }
    }
    public function show_blogs()
    {
        $blogs = blog::with('author')->with('favorites')->get();
        //now if blog is favorited
    //    dd($blogs);
    if($blogs->count() == 0){
        return response()->json(false, 200);
    }
        $result = $blogs->map(function ($blog) {
            return [
                'id' => $blog->blog_id,
                'title' => $blog->title,
                'Author_name' => $blog->author->name,
                'image_url' =>'uploads/blogs/'.$blog->image_url,
                'description' => $blog->content,
                // 'USER' => $blog->author->role,
                'created_at' => $blog->created_at,
                'isFavorite' => $blog->favorites->where('user_id', Auth::user()->id)->count() > 0 ? true : false,
                
            ];
        });
        return response()->json($result, 200);
    }
    public function show_doctor_blogs(Request $request)
    {
        $doctor_id = Auth::user()->id;
        $doctor = blog::where('author_id', $doctor_id)->get();
        return response()->json($doctor, 200);
    }
    public function add_blog(Request $request)
    {
        try{
             $author_id = Auth::user();
          $validator = Validator::make($request->all(), [
            'title' => 'required|unique:blogs',
            'description' => 'required',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:3048',
            'is_public' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        //check if there is failure in the $request->validate
        // dd($author_id->user_id);
        if ($request->hasFile('image_url')) {
        $image = $request->file('image_url');
        $fileExtension = $request->file('image_url')->extension();
        $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
        $this->GenerateBlogThumbnailsImage($image, $file_name);
        $blog = new blog();
        $blog->title = $request->title;
        $blog->content = $request->description;
        $blog->image_url = $file_name;
        $blog->author_id = $author_id->id;
        $blog->is_educational = $request->is_public;
        $blog->save();
        return response()->json('Blog created successfully', 200);
        }
         $blog = new blog();
        $blog->title = $request->title;
        $blog->content = $request->content;
        $blog->author_id = $author_id->user_id;
        $blog->is_educational = $request->is_educational;
        $blog->save();
        return response()->json('Blog created successfully', 200);
        }catch(\Exception $e){
            return response()->json($e->getMessage(), 400);
        }
    }
    public function GenerateBlogThumbnailsImage($image, $imageName)
    {
        $destination = public_path('uploads/blogs/');
        $img = Image::read($image->path());
        $img->resize(300, 300);
        $img->save($destination . '/' . $imageName);
    }
    /*******5179da6d-80de-41fd-bda6-07fdf44de650  *******/
    public function show_blog(Request $request)
    {
        $blog_id = $request->blog_id;
        // dd($blog_id);
        $blog = blog::with('comments')->with('author')->where('blog_id', $blog_id)->get();
        if ($blog->count() == 0) {
            return response()->json('Blog not found', 404);
        } else {
            $blog = $blog->map(function ($blogMaped) {
                return [
                    'blog_id' => $blogMaped->blog_id,
                    'title' => $blogMaped->title,
                    'content' => $blogMaped->content,
                    'Author_name' => $blogMaped->author->name,
                    'created_at' => $blogMaped->created_at,
                    'comments' => $blogMaped->comments->map(function ($comment) {
                        return [
                            'comment_id' => $comment->comment_id,
                            'comment' => $comment->comment,
                            'user_id' => $comment->user_id,
                        ];
                    }),
                ];
            });
            return response()->json($blog, 200);
        }
    }
    public function edit_blog(Request $request)
    {
        $blog_id = $request->blog_id;
        // dd($request->all());
        $blog = blog::where('blog_id', '=', $blog_id)->first();
        $blog->title = $request->title;
        $blog->slug = $request->slug;
        $blog->content = $request->content;
        $blog->save();
        return response()->json('Blog updated successfully', 200);
    }
    public function delete_blog(Request $request)
    {
        $blog_id = $request->blog_id;
        $blog = blog::where('blog_id', '=', $blog_id)->first();
        if ($blog == null) {
            return response()->json('Blog not found', 404);
        }
        $blog->delete();
        return response()->json('Blog deleted successfully', 200);
    }
    public function get_comments_of_blog(Request $request)
    {
        $blog_id = $request->blog_id;
        $comments = blog_comment::where('blog_id', '=', $blog_id)->get();
        if ($comments->count() == 0) {
            return response()->json('there is no comments', 404);
        }
       $comments = $comments->map(function ($comment) {
           return [
               'comment_id' => $comment->comment_id,
               'comment' => $comment->comment, 
               'comment_user_id' => $comment->user_id,
               'comment_user_name' => $comment->user->name,
               'blog_author_id' => $comment->blog->author->id,
               'blog_author_name' => $comment->blog->author->name,
           ];
       });
        return response()->json($comments, 200);
    }
    public function add_comment(Request $request)
    {
        $user_id = Auth::user()->id;
        $comment = new blog_comment();
        $comment->blog_id = $request->blog_id;
        $comment->user_id = $user_id;
        $comment->comment = $request->comment;
        $comment->save();
        return response()->json('Comment added successfully', 200);
    }
    public function edit_comment(Request $request)
    {
        $comment_id = $request->comment_id;
        $comment = blog_comment::where('comment_id', '=', $comment_id)->first();
        $comment->comment = $request->comment;
        $comment->save();
        return response()->json('Comment updated successfully', 200);
    }
    public function delete_comment(Request $request)
    {
        $comment_id = $request->comment_id;
        $comment = blog_comment::where('comment_id', '=', $comment_id)->first();
        if ($comment == null) {
            return response()->json('Comment not found', 404);
        }
        $comment->delete();
        return response()->json('Comment deleted successfully', 200);
    }
    // ADD meal recommendation to patient


    public function meal_system(Request $request){

    }
    public function add_meal_recommendation(Request $request)
    {
      // check if the user is not logged as doctor
      if (Auth::user()->role == 'doctor') {
        $patient_id = $request->patient_id;
        $meal_id = $request->meal_id;
        $meal_recommendation = new meal_recommendation();
        $meal_recommendation->patient_id = $patient_id;
        $meal_recommendation->meal_id = $meal_id;
        $meal_recommendation->meal_time = $request->meal_time;
        $meal_recommendation->meal_setup = $request->meal_setup;
        $meal_recommendation->save();
        //get user id from patient id
        $patient = patient::where('id', '=', $patient_id)->first();
        $user_id = $patient->user_id;
        $user = User::where('id', '=', $user_id)->first();
        $user->notify(new DoctorNewRecommandationNotfication($meal_recommendation));
        return response()->json('Meal recommendation added successfully', 200);
    }
    
    return response()->json('You are not authorized to add meal recommendation', 401);
}
    public function add_drug_recommendation(Request $request)
    {
        if (Auth::user()->role == 'doctor') {
        $patient_id = $request->patient_id;

        $drug_id = $request->drug_id;
        $drug_recommendation = new drug_recommendation();
        $drug_recommendation->patient_id = $patient_id;
        $drug_recommendation->drug_id = $drug_id;
        $drug_recommendation->when_to_take = $request->when_to_take;
        $drug_recommendation->time_to_take = $request->time_to_take;
        $drug_recommendation->number_of_takes = $request->number_of_takes;
        // $drug_recommendation->image_url = $request->image_url;
        $drug_recommendation->save();
        //get user id from patient id
        $patient = patient::where('id', '=', $patient_id)->first();
        $user_id = $patient->user_id;
        $user = User::where('id', '=', $user_id)->first();
        $user->notify(new DoctorNewDrugRecommandationNotfication($drug_recommendation));
        return response()->json('Drug recommendation added successfully', 200);
        }
        return response()->json('You are not authorized to add drug recommendation', 401);
    }
    public function add_exercise_recommendation(Request $request)
    {
        if (Auth::user()->role == 'doctor') {
        $patient_id = $request->patient_id;
        $exercise_id = $request->exercise_id;
        $exercise_recommendation = new exercise_recommendation();
        $exercise_recommendation->patient_id = $patient_id;
        $exercise_recommendation->exercise_id = $exercise_id;
        $exercise_recommendation->exercise_description = $request->exercise_description;
        $exercise_recommendation->save();
        //get user id from patient id
        $patient = patient::where('id', '=', $patient_id)->first();
        $user_id = $patient->user_id;
        $user = User::where('id', '=', $user_id)->first();
        $user->notify(instance: new DoctorNewExerciseRecommandationNotfication($exercise_recommendation));
        return response()->json(['state' => 'Exercise recommendation added successfully'], 200);
        }
        return response()->json(['state' => 'You are not authorized to add exercise recommendation'], 401);
    }
}
