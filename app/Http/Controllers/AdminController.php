<?php

namespace App\Http\Controllers;

use App\Models\blog;
use App\Models\blog_comment;
use App\Models\blood_test;
use App\Models\doctor;
use App\Models\drug_recommendation;
use App\Models\exercise;
use App\Models\exercise_recommendation;
use App\Models\Favorite;
use App\Models\glucose_reading;
use App\Models\meal_recommendation;
use App\Models\patient;
use App\Models\relative;
use App\Models\User;
use App\Models\user_profile;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Intervention\Image\Laravel\Facades\Image;
use LaravelDaily\LaravelCharts\Classes\LaravelChart;

class AdminController extends Controller
{
    public function patients() {
        $patients = patient::with('blood_tests')->paginate(5);
        // dd($patients->toArray());

        return view('admin.patient.patients', compact('patients'));
    }
    public function add_patient() {
        $doctors = doctor::all();
     return view('admin.patient.add_patient', compact('doctors'));   
    }
    public function store_patient(Request $request) {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6|required_with:confirm_password',
            'confirm_password' => 'required|same:password',
            'first_name' => 'required',
            'last_name' => 'required',
            'date_of_birth' => 'required|date',
            'contact_info' => 'required',
            'attachment' => 'required|mimes:pdf|max:2048',
            'test_type' => 'required',
            'doctor_id' => 'required',
            'result' => 'required',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        // dd($request->all());    
try {
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password); // استخدم bcrypt لتشفير كلمة المرور
        $user->role = 'patient';
        $user->save(); // حفظ المستخدم أولاً

        // توليد user_id بعد حفظ المستخدم
        $user_id = $user->id;
        if ($request->hasFile('image_url')) {
            $file = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/doctors'), $file_name);
            $user_profile = new user_profile();
            $user_profile->user_id = $user_id;
            $user_profile->image_url = $file_name;
            $user_profile->first_name = $request->first_name;
            $user_profile->last_name = $request->last_name;
            $user_profile->date_of_birth = $request->date_of_birth;
            $user_profile->contact_info = $request->contact_info;
            $user_profile->save();
        } else {
            $user_profile = new user_profile();
            $user_profile->user_id = $user_id;
            $user_profile->first_name = $request->first_name;
            $user_profile->last_name = $request->last_name;
            $user_profile->date_of_birth = $request->date_of_birth;
            $user_profile->contact_info = $request->contact_info;
            $user_profile->save();
        }
        $patient = new patient();
        $patient->user_id = $user_id;
        $patient->doctor_id = $request->doctor_id;
        $patient->save();

        if ($patient->save()) {
            $blood_test = new blood_test();
            $blood_test->patient_id = $patient->id;
            if ($request->hasFile('attachment')) {
                $file = $request->file('attachment');
                $fileExtension = $request->file('attachment')->extension();
                $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
                $file->move(public_path('uploads/patients/blood_tests'), $file_name);
                $blood_test->attachment = $file_name;
            }
            $blood_test->test_type = $request->test_type;
            $blood_test->result = $request->result;
            $blood_test->save();
            return redirect()->route('admin.patients.index')->with('status', 'Patient added successfully');
        }
        return redirect()->route('admin.patients.index')->with('status', 'Patient added successfully');
    } catch (\Exception $e) {
        return redirect()->route('admin.patients.index')->with('error', 'Failed to add patient');
    }
}
public function delete_patient($id) {
    try 
    {
        $petient = patient::find($id);
        $test = blood_test::where('patient_id', $id)->first();

        // dd($test);
        $user = User::find($petient->user_id);
        if(File::exists(public_path('uploads/patients/blood_tests/'.$test->attachment))) {
            File::delete(public_path('uploads/patients/blood_tests/'.$test->attachment));
        }
        $petient->delete(); 
        $user->delete();    
        return redirect()->route('admin.patients.index')->with('status', 'Patient deleted successfully');
    } catch (\Exception $e) {
        return redirect()->route('admin.patients.index')->with('error', 'Failed to delete patient');
    }
}
    public function search_patient() {
        $search_content = $_GET['search_content'];
        $users = User::where('name', 'like', "%$search_content%")->with('patient')->get();
        $patients = $users->whereNotNull('patient');

        $output = '';
        foreach ($patients as $patient) {
            $output .= '<tr>
                    <td class="text-center">' . $patient->patient->id . '</td>
                    <td class="text-center">' . $patient->name . '</td>
                    <td class="text-center">' . $patient->profile->first_name . ' ' . $patient->profile->last_name . '</td>
                    <td class="text-center">' . $patient->email . '</td>
                    ';

            if ($patient->patient->blood_tests->where('attachment', '!=', null)->first() == null) {
                $output .= '<td class="text-center"><div class="item text-danger">No Blood Test</div></td>';
            } elseif($patient->patient->blood_tests->where('attachment', '!=', null)->first() != null) {
                $output .= '<td class="text-center">
                <a href="'.url('uploads/patients/blood_tests').'/'. $patient->patient->blood_tests->where('attachment', '!=', null)->first()->attachment.'">
                <div class="item text-success">Show Test</div>
                </a>
                </td>';
            }
            $output .= '
                   <td>
                                    <div class="list-icon-function">
                                        <a href="'.route('admin.patients.edit_patient', $patient->patient->id).'">
                                            <div class="item edit">
                                                <i class="icon-edit-3"></i>
                                            </div>
                                        </a>
                                        <form action="{{'.route('admin.patients.delete_patient', $patient->id).'" method="POST">
                                             ' . csrf_field() . '
                                            ' . method_field('DELETE') . '
                                            <div class="item text-danger ">
                                            <button type="submit" class="item text-danger delete" style="border: none; background: none; cursor: pointer;">
                                                <i class="icon-trash-2"></i>
                                            </button>
                                            </div>
                                        </form>
                                    </div>
                                </td>

                   <tr>';
        }
        if ($patients->isEmpty()) {
            $output .= '<tr>
                    <td class="text-center" colspan="6">No Patients Found</td>
                   <tr>';
        }
        return $data = array(
            'row_result' => $output,
        );
            
        

    }
    public function updateStatus($user_id, $status_code)
    {
        try {
            $update_user = User::findOrFail($user_id)->update([
                'status' => $status_code
            ]);
            if ($update_user) {
                return redirect()->route('admin.user.index')->with('status', 'User status updated successfully');
            }
            return redirect()->route('admin.user.index')->with('error', 'Failed to update user status');
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function register()
    {
        return view('auth.register');
    }
    public function favorites()
    {
        $user_id = Auth::user()->id;
        $blogs = Favorite::where('user_id', '=', $user_id)->with('blog')->paginate(5);
        return view('admin.favorite.favorites', compact('blogs'));
    }
    public function deleteFavorite($id)
    {
        $favorite = Favorite::find($id);
        $favorite->delete();
        return redirect()->route('admin.blog.index')->with('status', 'Favorite deleted successfully');
    }
    public function addFavorite($id)
    {
        $blog_id = $id;
        $user_id = Auth::user()->id;
        $favorite = new Favorite();
        $favorite->blog_id = $blog_id;
        $favorite->user_id = $user_id;
        $favorite->save();
        return redirect()->route('admin.blog.index')->with('status', 'Blog added to favorite successfully');
    }
    public function index()
    {
        $doctors = doctor::count();
        $patients = patient::count();
        $blogs = blog::count();
        $users = User::count();
        $glucose_readers = glucose_reading::count();
        $Recommended_drugs = drug_recommendation::count();
        $Recommended_meals = meal_recommendation::count();
        $Recommended_exercises = exercise_recommendation::count();
        $all_blood_tests = blood_test::count();
        $all_relatives = relative::count();
        // recent glucose readers with patients and his doctor
        $recent_glucose_reader = glucose_reading::with('patient')
            ->with('patient.user.profile')->with('patient.doctor.user.profile')->paginate(5);

        $recent_glucose_readers = $recent_glucose_reader->map(function ($glucose_reading) {
            return [
                'glucose_reading_id' => $glucose_reading->id,
                'patient_name' => $glucose_reading->patient->user->profile->first_name . ' ' . $glucose_reading->patient->user->profile->last_name,
                'doctor_name' => $glucose_reading->patient->doctor->user->profile->first_name . ' ' . $glucose_reading->patient->doctor->user->profile->last_name,
                'glucose_reading_date' => $glucose_reading->created_at->format('Y-m-d'),
                'glucose_reading_value' => $glucose_reading->reading_value,
            ];
        });


        // dd($recent_glucose_readers);


        $chart_options = [
            'chart_title' => 'Glucose Readings',
            'column_class' => 'col-md-6 col-sm-6 col-xs-12',
            'chart_type' => 'bar',
            'report_type' => 'group_by_date',
            'group_by_field' => 'created_at',
            'group_by_period' => 'day',
            'model' => 'App\Models\glucose_reading',
            'group_by_date_format' => 'Y-m-d',
            'chart_height' => 500,
            'chart_color' => '4,300,0',

        ];
        $chart1 = new LaravelChart($chart_options);


        $all_Recommendations = $Recommended_drugs + $Recommended_meals + $Recommended_exercises;
        return view('admin.index', compact('chart1', 'recent_glucose_reader', 'recent_glucose_readers', 'all_relatives', 'all_blood_tests', 'Recommended_drugs', 'Recommended_meals', 'Recommended_exercises', 'all_Recommendations', 'glucose_readers', 'blogs', 'doctors', 'patients', 'users'));
    }

    public function updateRole(Request $request)
    {
        $user = User::find($request->user_id);
        // dd($request->all());
        $user->update([
            'role' => $request->role
        ]);
        return redirect()->route('admin.user.index')->with('status', 'User role updated successfully');
    }
    public function users()
    {
        $users = User::with('profile')->paginate(5);
        return view('admin.user.users', compact('users'));
    }
    public function search_blog(Request $request)
    {
        $search_content = $_GET['search_content'];
        $blogs = blog::where('title', 'like', "%$search_content%")->get();
        $output = '';
        
        foreach ($blogs as $blog) {
            $output .= '<tr>
                            <td class="text-center">' . $blog->blog_id . '</td>
                            <td class="text-center">' . $blog->title . '</td>
                            <td class="text-center">' . $blog->author->name . '</td>
                            <td class="text-center">' . $blog->created_at->format('Y-m-d') . '</td>
                            <td class="text-center">' . $blog->content . '</td>
                            <td class="text-center">
                                <div class="list-icon-function">
                                ';
        
            // ايقونة التعديل   
                            if ($blog->author_id == Auth::user()->id) {
                    
            
                                 $output .= '  <a href="' . route('admin.blog.edit_blog', ['id' => $blog->blog_id]) . '">
                                        <div class="item edit">
                                            <i class="icon-edit-3"></i>
                                        </div>
                                    </a>
                                    <form action="' . route('admin.blog.delete_blog', ['id' => $blog->blog_id]) . '" method="POST" style="display:inline;">
                                        ' . csrf_field() . '
                                        ' . method_field('DELETE') . '
                                        <button type="submit" class="item text-danger delete" style="border: none; background: none; cursor: pointer;">
                                            <i class="icon-trash-2"></i>
                                        </button>
                                    </form>';
                            }
        
            // أيقونة المفضلة
            if ($blog->favorites()->where('user_id', Auth::user()->id)->exists()) {
                $output .= '<img src="icon/heart-icon.svg" width="25px" alt="Favorited">'; 
            } else {
                $output .= '<a href="' . route('admin.blog.favorite_blog', ['id' => $blog->blog_id]) . '">
                                <img src="icon/heart-thin-icon.svg" width="25px" alt="Favorite"> 
                            </a>';
            }
        
            $output .= '   </div>
                            </td>
                        </tr>';
        }
 
        if ($blogs->count() == 0) {
            $output = '<tr>
                            <td class="text-center" colspan="6">No Data Found</td>
                        </tr>';
        }
        return $data = array(
            'row_result' => $output,
        );
    }
    public function search_favorite(Request $request)
    {   
        $search_content = $_GET['search_content'];
        // $blog_favorated = blog::where('title', 'like', "%$search_content%")->get();
        $blogs = blog::whereHas('favorites', function ($query) {
            $query->where('user_id', Auth::user()->id);
        })->where('title', 'like', "%$search_content%")->with('favorites')->get();
        
        $output = '';
        
        foreach ($blogs as $blog) {
            $output .= '<tr>
                            <td class="text-center">' . $blog->blog_id . '</td>
                                <td class="text-center">' . $blog->title . '</td>
                                <td class="text-center">' . $blog->author->name . '</td>
                                <td class="text-center">' . $blog->created_at->format('Y-m-d') . '</td>
                                <td class="text-center">' . $blog->content . '</td>
                                <td class="text-center">
                                    <div class="list-icon-function">
                                       
        
         
               <form action="' . route('admin.favorites.destroy', ['id' => $blog->favorites()->where('user_id', Auth::user()->id)->first()->id]) . '" method="post">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <button type="submit" class="item text-danger delete" style="border: none; background: none; cursor: pointer;">
                                    <img src="icon/heart-icon.svg" width="25px" alt="Favorite"> 
                                </button>
                            </form>
            
           </div>
                            </td>   
                        </tr>';
        
        }
        if ($blogs->count() == 0) {
            $output = '<tr>
                            <td class="text-center" colspan="6">No Data Found</td>
                        </tr>';
        }
        return $data = array(
            'row_result' => $output,
        );
    }
    public function search(Request $request)
    {
        $search_content = $_GET['search_content'];
        $users = User::where('name', 'like', "%$search_content%")->get();
        $output = '';



        foreach ($users as $user) {
            $output .= '<tr>
                    <td class="text-center">' . $user->id . '</td>
                    <td class="text-center">
                        <div class="image">';

            if ($user->profile != null && $user->profile->image_url != null) {
                $output .= '<img src="' . asset('uploads/doctors/' . $user->profile->image_url) . '" alt="" class="image">';
            } else {
                $output .= '<img src="' . asset('uploads/doctors/user.svg') . '" class="image">';
            }

            $output .= '      </div>
                        <div class="name">
                            <a href="#" class="body-title-2">' . $user->name . '</a>
                        </div>
                    </td>
                    <td class="text-center">' . $user->email . '</td>
                    <td class="text-center">';

            if ($user->role == null) {
                $output .= '<form action="' . route('admin.user.update_role') . '" method="POST">
                        ' . csrf_field() . '
                        <div class="flex items-center justify-center gap-10">
                            <input type="hidden" name="user_id" value="' . $user->id . '">
                            <div class="flex items-center justify-center p-2">
                                <select name="role" class="form-select p-6 m-2 rounded-lg text-2xl px-10">
                                    <option value="admin">Admin</option>
                                    <option value="doctor">Doctor</option>
                                    <option value="patient">Patient</option>
                                    <option value="relative">Relative</option>
                                </select>
                            </div>
                            <div class="flex items-center justify-center">
                                <button type="submit" class="tf-button">Save</button>
                            </div>
                        </div>
                    </form>';
            } else {
                $output .= $user->role;
            }

            $output .= '      </td>
                    <td class="text-center">
                        <div class="list-icon-function">
                            <a href="' . route('admin.user.edit_user', $user->id) . '">
                                <div class="item edit">
                                    <i class="icon-edit-3"></i>
                                </div>
                            </a>
                            <form action="' . route('admin.user.delete_user', $user->id) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . '
                                ' . method_field('DELETE') . '
                                <div class="item text-danger delete">
                                    <i class="icon-trash-2"></i>
                                </div>
                            </form>';

            // إضافة الأزرار مع رسالة تأكيد
            if ($user->status == 'active') {
                $output .= '<a href="' . route('user.status.update', ['user_id' => $user->id, 'status_code' => 'suspend']) . '" class="btn btn-danger m-2 p-2 confirm-action">
                        Suspend
                    </a>';
            } else {
                $output .= '<a href="' . route('user.status.update', ['user_id' => $user->id, 'status_code' => 'active']) . '" class="btn btn-success m-2 confirm-action">
                        Active
                    </a>';
            }

            $output .= '      </div>
                    </td>
                </tr>';
        }
        if ($users->count() == 0) {
            $output .= '<tr>
                                <td colspan="5" class="text-center">لا يوجد نتائج</td>
                            </tr>';
        }
        return $data = array(
            'row_result' => $output,
        );
    }
    public function search_doctor(Request $request)
    {
        $search_content = $_GET['search_content'];
        $users = User::where('email', 'like', "%$search_content%")->with('doctor')->get();
        $doctors = $users->whereNotNull('doctor');

        $output = '';


        foreach ($doctors as $doctor) {
            $output .= '<tr>
                    <td class="text-center">' . $doctor->doctor->id . '</td>
                    <td class="text-center">' . $doctor->name . '</td>
                    <td class="pname">
                        <div class="image">
                            <!-- يمكنك إضافة صورة هنا إذا كانت متاحة -->
                        </div>
                        <div class="name">
                            <a href="#" class="body-title-2">' . $doctor->profile->first_name . ' ' . $doctor->profile->last_name . '</a>
                        </div>
                    </td>
                    <td class="text-center">' . $doctor->email . '</td>
                    <td class="text-center">' . $doctor->doctor->status . '</td>
                    <td>';

            if ($doctor->doctor->resume == null) {
                $output .= '<div class="item text-danger">No Cv</div>';
            } else {
                $output .= '<a href="' . url('uploads/doctors/cv') . '/' . $doctor->doctor->resume . '">
                        <div class="item text-primary">show Cv</div>
                    </a>';
            }

            $output .= '    </td>
                    <td>
                        <div class="list-icon-function">
                            <a href="http://127.0.0.1:8000/doctors/' . $doctor->doctor->id . '/edit-doctor">
                                <div class="item edit">
                                    <i class="icon-edit-3"></i>
                                </div>
                            </a>
                        </div>
                    </td>
                </tr>';
        }
        if ($doctors->count() == 0) {
            $output .= '<tr class="text-center fs-2">
                            <td colspan="7" class="text-center ">
                            <img src="'.asset('images/not_found.png').'" class="effect8"
                            alt="">
                            <p claass="fs-2"><h3 class="text-danger p-3">لا يوجد نتائج بحث</h3>  </p>
                            </td>
                        </tr>';
        }
        return $data = array(
            'row_result' => $output,
        );
    }
    public function add_user()
    {
        return view('admin.user.add_user');
    }
    public function store_user(Request $request)
    {

        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6|required_with:confirm_password',
            'role' => 'required',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        // dd($request->all());

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password); // استخدم bcrypt لتشفير كلمة المرور
        $user->role = $request->role;
        $user->save(); // حفظ المستخدم أولاً
        if ($request->hasFile('image_url')) {
            // dd($request->file('image_url'));
            $file = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/doctors'), $file_name);
            $user_profile = new user_profile();
            $user_profile->user_id = $user->id;
            $user_profile->image_url = $file_name;
            $user_profile->first_name = $request->name;
            $user_profile->last_name = $request->name;
            $user_profile->date_of_birth = '2000-01-01';
            $user_profile->save();
        }

        return redirect()->route('admin.user.index',);
    }
    public function edit_user($id)
    {
        $user = User::with('profile')->find($id);
        // dd($user->toArray());
        return view('admin.user.edit_user', compact('user'));
    }

    public function update_user(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:6|required_with:confirm_password',
            'role' => 'required',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        $user = User::where('id', '=', $id)->first();
        // dd($request->all());
        if ($request->hasFile('image_url')) {
           if (File::exists(public_path('uploads/doctors') . '/' . $user->profile->image_url)) {
                File::delete(public_path('uploads/doctors') . '/' . $user->profile->image_url);

            }
            $image = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateDoctorThumbnailsImage($image, $file_name);
            $user = user_profile::where('user_id','=',$id)->first();
            if($user->image_url == null){
                $user->update([
                    'image_url' => $file_name,
                ]);
            }
            $user_profile = new user_profile();
            $user_profile->user_id = $id;
            $user_profile->image_url = $file_name;
            $user_profile->first_name = $request->name;
            $user_profile->last_name = $request->name;
            $user_profile->date_of_birth = '2000-01-01';
            $user_profile->save();
        }
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'role' => $request->role,
            'password' => bcrypt($request->password)
        ]);
        return redirect()->route('admin.user.index')->with('status', 'User updated successfully');
    }
    public function delete_user($id)
    {
        $user = User::find($id);
        $user->delete();
        return redirect()->route('admin.user.index')->with('status', 'User deleted successfully');
    }
    public function doctors()
    {
        $doctors = doctor::with('user')->with('user.profile')->paginate(5);
        // dd($doctors->toArray());

        return view('admin.doctor.doctors', compact('doctors',));
    }
    public function add_doctor()
    {

        return view('admin.doctor.add_doctor');
    }
    public function store_doctor(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6|required_with:confirm_password|',
            'confirm_password' => 'required|same:password',
            'resume' => 'required|mimes:pdf|max:2048',
            'specialization' => 'required|max:255',
            'status' => 'required',
            'first_name' => 'required|max:40',
            'last_name' => 'required|max:40',
            'date_of_birth' => 'required|date',
            'contact_info' => 'required|max:14|min:9|unique:user_profiles',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'license_expiry_date' => 'required|date,before_or_equal:license_expiry_date',
            'license_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'license_number' => 'required|numeric|unique:doctors',
        ]);
        // dd($request->all());
        
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password); // استخدم bcrypt لتشفير كلمة المرور
        $user->role = 'doctor';
        $user->save(); // حفظ المستخدم أولاً

        // توليد user_id بعد حفظ المستخدم
        $userId = $user->id;
        
        if ($request->hasFile('resume') && $request->hasFile('license_image')) {
            $file = $request->file('resume');
            $fileExtension = $request->file('resume')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/doctors/cv'), $file_name);
            
            $license_file = $request->file('license_image');
            $fileExtensionLicense = $request->file('license_image')->extension();
            $file_License_name = Carbon::now()->timestamp . '.' . $fileExtensionLicense;
            $license_file->move(public_path('uploads/doctors/licenses'), $file_License_name);
            $user->doctor()->create([
                'user_id' => $userId, // تعيين user_id
                'resume' => $file_name,
                'license_image' => $file_License_name,
                'license_number' => $request->license_number,
                'license_expiry_date' => $request->license_expiry_date,
                'specialization' => $request->specialization,
                'status' => $request->status,
            ]);        
        }elseif($request->hasFile('resume')) {
            $file = $request->file('resume');
            $fileExtension = $request->file('resume')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/doctors/cv'), $file_name);
            $user->doctor()->create([
                'user_id' => $userId, // تعيين user_id
                'resume' => $file_name,
                'license_number' => $request->license_number,
                'license_expiry_date' => $request->license_expiry_date,
                'specialization' => $request->specialization,
                'status' => $request->status,
            ]);
        }elseif($request->hasFile('license_image')) {
            $license_file = $request->file('license_image');
            $fileExtensionLicense = $request->file('license_image')->extension();
            $file_License_name = Carbon::now()->timestamp . '.' . $fileExtensionLicense;
            $license_file->move(public_path('uploads/doctors/licenses'), $file_License_name);
            $user->doctor()->create([
                'user_id' => $userId, // تعيين user_id
                'license_image' => $file_License_name,
                'license_number' => $request->license_number,
                'license_expiry_date' => $request->license_expiry_date,
                'specialization' => $request->specialization,
                'status' => $request->status,
            ]);
        }
        else {
            $user->doctor()->create([
                'user_id' => $userId, // تعيين user_id
                'license_number' => $request->license_number,
                'license_expiry_date' => $request->license_expiry_date,
                'specialization' => $request->specialization,
                'status' => $request->status,
            ]);
        }
        if ($request->hasFile('image_url')) {

            $image = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateDoctorThumbnailsImage($image, $file_name);
            $user->profile()->create([
                'user_id' => $userId,
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'date_of_birth' => $request->date_of_birth,
                'contact_info' => $request->contact_info,
                'image_url' => $file_name,
            ]);
            return redirect()->route('admin.doctors.index')->with('status', 'Doctor added successfully');
        }
        $defualt_profile_image='default.png';
        $user->profile()->create([
            'user_id' => $userId,
            'first_name' => $request->first_name,
            'image_url'=>$defualt_profile_image,
            'last_name' => $request->last_name,
            'date_of_birth' => $request->date_of_birth,
            'contact_info' => $request->contact_info,
        ]);
        return redirect()->route('admin.doctors.index')->with('status', 'Doctor added successfully');
    }
    public function GenerateDoctorThumbnailsImage($image, $imageName)
    {
        $destination = public_path('uploads/doctors/');
        $img = Image::read($image->path());
        $img->cover(124, 124, "top");
        $img->resize(124, 124, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destination . '/' . $imageName);
    }
    public function edit_doctor($id)
    {
        $doctor = doctor::find($id);
        // $profile = $doctor->profile()->find($id);
        return view('admin.doctor.edit_doctor', compact('doctor'));
    }
    public function update_doctor(Request $request, $id)
    {
        
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            // 'resume' => 'required|mimes:pdf|max:2048',
            'specialization' => 'required|max:255',
            'status' => 'required',
            'first_name' => 'required|max:40',
            'last_name' => 'required|max:40',
            'date_of_birth' => 'required|date|before:today',
            'contact_info' => 'required|min:9|max:14',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'license_image' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'license_number' => 'required',
            'license_expiry_date' => 'required|date|after:today', 
        ]);
        // dd($request->all());
        $doctor = doctor::find($id);
        if($request->hasFile('license_image')) {
            if(File::exists(public_path('uploads/doctors/licenses') . '/' . $doctor->license_image)) {
                File::delete(public_path('uploads/doctors/licenses') . '/' . $doctor->license_image);
            }
            $image = $request->file('license_image');
            $fileExtension = $request->file('license_image')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $image->move(public_path('uploads/doctors/licenses'), $file_name);
            $doctor->update([
                'license_image' => $file_name,
                'license_number' => $request->license_number,
                'license_expiry_date' => $request->license_expiry_date,
            ]);
        }
        if ($request->hasFile('resume')) {
            if (File::exists(public_path('uploads/doctors/cv') . '/' . $doctor->resume)) {
                File::delete(public_path('uploads/doctors/cv') . '/' . $doctor->resume);
            }
            $file = $request->file('resume');
            $fileExtension = $request->file('resume')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $file->move(public_path('uploads/doctors/cv'), $file_name);
            $doctor->update([
                'license_expiry_date' => $request->license_expiry_date,
                'license_number' => $request->license_number,
                'resume' => $file_name,
                'specialization' => $request->specialization,
                'status' => $request->status,
            ]);
        } else {
            $doctor->update([
                // 'resume' => $request->resume,
                'license_expiry_date' => $request->license_expiry_date,
                'license_number' => $request->license_number,
                'specialization' => $request->specialization,
                'status' => $request->status,
            ]);
        }
        $doctor->user()->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        if ($request->hasFile('image_url')) {
            if (File::exists(public_path('uploads/doctors') . '/' . $doctor->user->profile->image_url)) {
                File::delete(public_path('uploads/doctors') . '/' . $doctor->user->profile->image_url);
            }
            $image = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateDoctorThumbnailsImage($image, $file_name);
            $profile = user_profile::where('user_id', '=', $doctor->user_id)->first();
            $profile->update([
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'date_of_birth' => $request->date_of_birth,
                'contact_info' => $request->contact_info,
                'image_url' => $file_name,
            ]);
            return redirect()->route('admin.doctors.index')->with('status', 'Doctor updated successfully');
        }
        $profile = user_profile::where('user_id', '=', $doctor->user_id)->first();
        $profile->update([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'date_of_birth' => $request->date_of_birth,
            'contact_info' => $request->contact_info,
        ]);


        return redirect()->route('admin.doctors.index')->with('status', 'Doctor updated successfully');
    }

    public function delete_doctor($id)
    {

        $doctor = doctor::find($id);
        $User = User::find($doctor->user_id);
        $User->delete();
        return redirect()->route('admin.doctors.index')->with('status', 'Doctor deleted successfully');
    }


    public function blogs()
    {
        $blogs = blog::orderBy('blog_id', 'desc')->with('favorites')->paginate(5);
        // dd($blogs->toArray());
        return view('admin.blog.blogs', compact('blogs'));
    }
    public function add_blog()
    {
      return view('admin.blog.add_blog');
    }
    public function store_blog(Request $request)
    {

        $request->validate([
            'title' => 'required|unique:blogs',
            'content' => 'required',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        $slug=Str::slug($request->title);
        dd($slug);        
        $user = Auth::user()->id;
        $blog = new blog();

        $blog->title = $request->title;
        $blog->author_id = $user;
        $blog->slug = $request->slug;
        $blog->content = $request->content;
        if ($request->hasFile('image_url')) {
            $image = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateBlogThumbnailsImage($image, $file_name);
            $blog->image_url = $file_name;
        }



        // $blog->image_url = $request->image_url;
        $blog->save();
        return redirect()->route('admin.blog.index')->with('status', 'Blog added successfully');
    }
    public function GenerateBlogThumbnailsImage($image, $imageName)
    {
        $destination = public_path('uploads/blogs/');
        $img = Image::read($image->path());
        $img->cover(124, 124, "top");
        $img->resize(124, 124, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destination . '/' . $imageName);
    }
    public function edit_blog($id)
    {
        $blog = blog::where('blog_id', '=', $id)->first();
        
        return view('admin.blog.edit_blog', compact('blog'));
    }
    public function update_blog(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'slug' => 'required',
            'content' => 'required',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);

        $blog = blog::find($id);
        if ($request->hasFile('image_url')) {
            if (File::exists(public_path('uploads/blogs') . '/' . $blog->image_url)) {
                File::delete(public_path('uploads/blogs') . '/' . $blog->image_url);
            }
            $image = $request->file('image_url');
            $fileExtension = $request->file('image_url')->extension();
            $file_name = Carbon::now()->timestamp . '.' . $fileExtension;
            $this->GenerateBlogThumbnailsImage($image, $file_name);
            $blog->image_url = $file_name;
        }
        $blog->update([
            'author_id' => Auth::user()->id,
            'title' => $request->title,
            'slug' => $request->slug,
            'content' => $request->content
        ]);
        return redirect()->route('admin.blog.index')->with('status', 'Blog updated successfully');
    }
    public function delete_blog($id)
    {
        $blog = blog::find($id);
        $blog->delete();
        return redirect()->route('admin.blog.index')->with('status', 'Blog deleted successfully');
    }

    // _____________________________________________________________________________________________
    public function comments()
    {
        $comments = blog_comment::orderBy('comment_id', 'desc')->paginate(5);
        return view('admin.comment.comments', compact('comments'));
    }
    public function add_comment()
    {
        $authors = User::all();
        $blogs = blog::all();
        return view('admin.comment.add_comment', compact('authors', 'blogs'));
    }
    public function store_comment(Request $request)
    {
        // dd($request->tit;
        $request->validate([
            'title' => 'required',
            'comment' => 'required',
            'image_url' => 'image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);
        $user = Auth::user()->id;
        $comment = new blog_comment();
        $comment->blog_id = $request->title;
        $comment->user_id = $user;
        $comment->comment = $request->comment;
        $comment->save();
        return redirect()->route('admin.comments.index')->with('status', 'Comment added successfully');
    }
    public function edit_comment($id)
    {
        $comment = blog_comment::where('comment_id', '=', $id)->first();
        $authors = User::all();
        $blogs = blog::all();
        return view('admin.comment.edit_comment', compact('comment', 'authors', 'blogs'));
    }
    public function update_comment(Request $request, $id)
    {
        // dd($id);
        $comment = blog_comment::find($id);
        $user = Auth::user()->id;
        $comment->update([
            'blog_id' => $request->title,
            'user_id' => $user,
            'comment' => $request->comment
        ]);
        return redirect()->route('admin.comments.index')->with('status', 'Comment updated successfully');
    }
    public function delete_comment($id)
    {
        $comment = blog_comment::find($id);
        $comment->delete();
        return redirect()->route('admin.comments.index')->with('status', 'Comment deleted successfully');
    }
}
