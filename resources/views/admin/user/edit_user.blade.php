@extends('layouts.admin')

@section('content')
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>Edit User</h3>
                <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                    <li>
                        <a href="{{route('admin.index')}}">
                            <div class="text-tiny">Dashboard</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <a href="{{route('admin.user.index')}}">
                            <div class="text-tiny">Users</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <div class="text-tiny">Edit Users</div>
                    </li>
                </ul>
            </div>

            <!-- new-category -->
            <div class="wg-box" dir="rtl">
                <form class="form-new-product form-style-1" action="{{route('admin.user.update_user', $user->id)}}"
                    enctype="multipart/form-data" method="POST">
                    @csrf
                    @method('PUT')
                    <fieldset class="name">
                        <div class="body-title"><span class="tf-color-1">*</span>  اسم المستخدم   </div>
                        <input class="flex-grow" type="text" placeholder="ادخل اسم المستخدم" name="name" tabindex="0"
                        value="{{$user->name}}" aria-required="true">
                    </fieldset>
                        @error('name') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span>  البريد الالكتروني  </div>
                            <input class="flex-grow" type="email" placeholder="ادخل البريد الالكتروني" name="email" tabindex="0"
                                value="{{$user->email}}" aria-required="true">
                            </fieldset>
                            @error('email') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                            <fieldset class="role">
                                <div class="body-title"><span class="tf-color-1">*</span>  نوع المستخدم</div>
                                <select class="form-select text-center" name="role">
                                        <option value="{{$user->role}}">
                                            @if($user->role == 'admin')
                                                مسئوول  
                                            @elseif($user->role == 'doctor')
                                                طبيب
                                            @elseif($user->role == 'patient')
                                                مريض
                                            @elseif($user->role == 'relative')
                                                قريب
                                            @endif
                                                
                                            </option>
                                        <option value="admin">مسئوول</option>
                                        <option value="doctor">طبيب</option>
                                        <option value="patient">مريض</option>
                                        <option value="relative">قريب</option>
                                    </select>
                            </fieldset>
                            @error('role') <span class="alert alert-danger text-center">{{$message}}</span>@enderror

                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span>  كلمة المرور </div>
                            <input class="flex-grow" type="password" placeholder=" دخل كلمة المرور" name="password" tabindex="0"
                                value="" aria-required="true">
                        </fieldset>
                        @error('password') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span>  تأكيد كلمة المرور  </div>
                            <input class="flex-grow" type="password" placeholder="تاكيد كلمة المرور" name="confirm_password" tabindex="0"
                                value="" aria-required="true">
                        </fieldset>
                        @error('confirm_password') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        <fieldset>
                            <div class="body-title"><span class="tf-color-1">*</span> تحميل صورة المستخدم</div>
                <div class="upload-image flex-grow">
                    @if (isset($user->profile->image_url))
                    <div class="item" id="" >
                        <img src="{{asset('uploads/doctors')}}/{{$user->profile->image_url}}" class="effect8" alt="{{$user->name}}">
                    </div>
                    @else
                    <div class="item" id="imgpreview" >
                        <img src="{{asset('uploads/doctors/user.svg')}}" class="effect8" alt="{{$user->name}}">
                    </div>
                    @endif
        
                    <div id="upload-file" class="item up-load">
                        <label class="uploadfile" for="myFile">
                            <span class="icon">
                                <i class="icon-upload-cloud"></i>
                            </span>
                            <span class="body-text">اسحب الصورة هنا أو <span class="tf-color">انقر للتصفح</span></span>
                            <input type="file" id="myFile" name="image_url" accept="image/*">
                        </label>
                    </div>
                </div>
                </fieldset>
                @error('image') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
            <div class="bot " dir="ltr">
                <div></div>
                <button class="tf-button w208" type="submit">تعديل</button>
            </div>
        </div>
        </form>
</div>
</div>
</div>
@endsection
@push('scripts')
    <script>
        $(function () {
            $("#myFile").on("change", function () {
                const photoInp = $("#myFile");
                const [file] = this.files
                if (file) {
                    $("#imgpreview img").attr('src', URL.createObjectURL(file));
                    $("#imgpreview").show();
                }
            });
            $("input[name='name']").on("change", function () {
                $("input[name='slug']").val(StringToSlug($(this).val()));
            });
        });

        function StringToSlug(Text) {
            return Text.toLowerCase().replace(/[^\w]+/g, "").replace(/ +/g, "-");

        }
    </script>
@endpush