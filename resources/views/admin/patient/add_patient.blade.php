@extends('layouts.admin')

@section('content')

    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>Patient infomation</h3>
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
                        <a href="{{route('admin.patients.index')}}">
                            <div class="text-tiny">Patients</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <div class="text-tiny">New Patients</div>
                    </li>
                </ul>
            </div>

            <!-- new-category -->
            <div class="wg-box" dir="rtl">
                <form class="form-new-product form-style-1" action="{{route('admin.patients.store_patient')}}"
                    enctype="multipart/form-data" method="POST">
                    @csrf

                    <fieldset class="name pt-10">
                        {{-- border buttom with width 4  --}}   
                        
                        <div class="h4 pb-2 mb-4 text-primary border-bottom border-2 border-primary">

                            <span>البيانات الشخصية</span>
                        </div>
                    </fieldset>
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="name w-full">
                            <div class="body-title"><span class="tf-color-1">*</span> اسم المستخدم </div>
                            <input class="" type="text" placeholder="اسم المستخدم" name="name" tabindex="0"
                                value="{{old('name')}}" aria-required="true">
                                @error('name') <span class="alert alert-danger text-center mt-4">{{$message}}</span>@enderror
                        </fieldset>
                        <input type="hidden" name="role" value="patient">
                        <fieldset class="email">
                            <div class="body-title"><span class="tf-color-1">*</span> الربيد الالكتروني </div>
                            <input class="flex-grow" type="text" placeholder="الربيد الالكتروني" name="email" tabindex="0"
                                value="{{old('email')}}" aria-required="true">
                                @error('email') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                        <fieldset class="contact">
                            <div class="body-title"><span class="tf-color-1">*</span> رقم الموبايل</div>
    
                            <input class="flex-grow" type="number" placeholder="رقم الموبايل" name="contact_info"
                                tabindex="0" value="{{old('contact_info')}}" >
                                @error('contact_info') <span class="alert alert-danger text-center">{{$message}}</span>@enderror 
                            </fieldset>
                        
                    </fieldset>
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="name w-full">
                            <div class="body-title"><span class="tf-color-1">*</span> الاسم الاول </div>
                            <input class="" type="text" placeholder="الاسم الاول " name="first_name" tabindex="0"
                                value="{{old('first_name')}}" aria-required="true">
                                @error('first_name') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                        <input type="hidden" name="role" value="patient">
                        <fieldset class="last_name">
                            <div class="body-title"><span class="tf-color-1">*</span>  الاسم الثاني </div>
                            <input class="flex-grow" type="text" placeholder="الاسم الثاني " name="last_name" tabindex="0"
                                value="{{old('last_name')}}" aria-required="true">
                                @error('last_name') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                        <fieldset class="date_of_birth">
                            <div class="body-title"><span class="tf-color-1">*</span>تاريخ الميلاد </div>
                            <input class="flex-grow" type="date" placeholder="ادخل تاريخ الميلاد" name="date_of_birth" tabindex="0"
                                value="{{old('date_of_birth')}}" aria-required="true">
                                @error('date_of_birth') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                    </fieldset>

                    <fieldset class="name grid grid-cols-3 gap-10">
                        <fieldset class="test_type">
                            <div class="body-title rounded"><span class="tf-color-1 rounded">*</span>نوع الفحص</div>
                            <select class="form-select  fs-2 p-10 rounded  " name="test_type" aria-label="Large select example">
                                <option class="p-10 fo" selected>اختر نوع الفحص</option>
                                <option value="hba1c">الفحص التراكمي</option>
                                <option value="triglycerides">فحص الدهون</option>
                                <option value="kidney_function">فحص وظائف الكلى </option>
                              </select>
                            @error('test_type') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                        <fieldset class="result">
                            <div class="body-title"><span class="tf-color-1">*</span> نتيجة الفحص </div>
                            <input class="flex-grow form" type="text" placeholder="ادخل نتيجة الفحص" name="result"
                                tabindex="0" value="{{old('result')}}" aria-required="true">
                                @error('result') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                        <fieldset class="attachment">
                            <div>
                                <div class="body-title"><span class="tf-color-1">*</span> ملف الفحص</div>
                                <input class="form-control form-control-lg" name="attachment" id="formFileLg" type="file">
                              </div>
                                @error('attachment') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                    </fieldset>

                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="doctor_name">
                            <div class="body-title rounded"><span class="tf-color-1 rounded">*</span>نوع الفحص</div>
                            <select class="form-select  fs-2 p-10 rounded  " name="doctor_id" aria-label="Large select example">
                                <option class="p-10 fo" selected>اختر طبيب</option>
                               @foreach ($doctors as $doctor )
                               <option value="{{$doctor->id}}">{{$doctor->user->profile->first_name}} {{$doctor->user->profile->last_name}}</option>
                               @endforeach
                              </select>
                            @error('doctor_name') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        </fieldset>
                    <fieldset class="password">
                        <div class="body-title"><span class="tf-color-1">*</span> كلمة المرور</div>

                        <input class="flex-grow" type="text" placeholder="ادخل كلمة المرور" name="password" tabindex="0"
                            value="{{old('password')}}" aria-required="true">
                            @error('password') <span class="alert alert-danger text-center">{{$message}}</span>@enderror 
                    </fieldset>
                    <fieldset class="password">
                        <div class="body-title"><span class="tf-color-1">*</span> تأكيد كلمة المرور </div>

                        <input class="flex-grow" type="text" placeholder="تأكيد كلمة المرور" name="confirm_password"
                            tabindex="0" value="{{old('confirm_password')}}" aria-required="true">
                            @error('confirm_password') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                    </fieldset>
                    </fieldset>
                    <fieldset>
                    <div class="body-title"><span class="tf-color-1">*</span> تحميل صورة المستخدم</div>
                        <div class="upload-image flex-grow">
                            <div class="item" id="imgpreview" style="display:none">
                                <img src="upload-1.html" class="effect8" alt="">
                            </div>
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
                    @error('image_url') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
            <div class="bot " dir="ltr">
                <div></div>
                <button class="tf-button w208" type="submit">حفظ</button>
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