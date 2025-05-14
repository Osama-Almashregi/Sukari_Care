@extends('layouts.admin')

@section('content')
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>Doctor infomation</h3>
                <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                    <li>
                        <a href="{{ route('admin.index') }}">
                            <div class="text-tiny">Dashboard</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <a href="{{ route('admin.doctors.index') }}">
                            <div class="text-tiny">Doctors</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <div class="text-tiny">New Doctors</div>
                    </li>
                </ul>
            </div>

            <!-- new-category -->
            <div class="wg-box" dir="rtl">
                <form class="form-new-product form-style-1" action="{{ route('admin.doctors.store_doctor') }}"
                    enctype="multipart/form-data" method="POST">
                    @csrf
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="name w-full">
                            <div class="body-title"><span class="tf-color-1">*</span> اسم المستخدم </div>
                            <input class="" type="text" placeholder="اسم المستخدم" name="name" tabindex="0"
                                value="{{ old('name') }}" aria-required="true">
                            @error('name')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                                span>
                            @enderror
                        </fieldset>
                        <input type="hidden" name="role" value="doctor">
                        <fieldset class="email">
                            <div class="body-title"><span class="tf-color-1">*</span> الربيد الالكتروني </div>
                            <input class="flex-grow" type="text" placeholder="الربيد الالكتروني" name="email"
                                tabindex="0" value="{{ old('email') }}" aria-required="true">
                            @error('email')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset class="name w-full">
                            <div class="body-title"><span class="tf-color-1">*</span> الاسم الاول </div>
                            <input class="" type="text" placeholder="الاسم الاول " name="first_name" tabindex="0"
                                value="{{ old('first_name') }}" aria-required="true">
                            @error('first_name')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                    </fieldset>
                    <fieldset class="name grid grid-cols-2 gap-10">

                        <input type="hidden" name="role" value="doctor">
                        <fieldset class="last_name">
                            <div class="body-title"><span class="tf-color-1">*</span> الاسم الثاني </div>
                            <input class="flex-grow" type="text" placeholder="الاسم الثاني " name="last_name"
                                tabindex="0" value="{{ old('last_name') }}" aria-required="true">
                            @error('last_name')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset dir="rtl" class="date_of_birth">
                            <div class="body-title"><span class="tf-color-1">*</span>تاريخ الميلاد </div>
                            <input class="flex-grow" type="date" placeholder="ادخل تاريخ الميلاد" name="date_of_birth"
                                tabindex="0" value="{{ old('date_of_birth') }}" aria-required="true" min="1880-01-01" max="2000-12-31">
                            @error('date_of_birth')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset class="contact">
                            <div class="body-title"><span class="tf-color-1">*</span> رقم الموبايل</div>

                            <input class="flex-grow" type="text" placeholder="رقم الموبايل" name="contact_info" 
                                tabindex="0" value="{{ old('contact_info') }}">
                            @error('contact_info')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                    </fieldset>

                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="name">
                            <div class="body-title " dir="rtl" dir="rtl"><span class="tf-color-1">*</span>الحاله
                                الوظيفيه</div>
                            <select class="form-select text-center fs-1" name="status">
                                <option class="fs-2" value="active">نشيط</option>
                                <option class="fs-2" value="paused">موقف</option>
                            </select>
                            @error('status')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span> التخصص </div>
                            <input class="flex-grow" type="text" placeholder="ادخل التخصص" name="specialization"
                                tabindex="0" value="{{ old('specialization') }}" aria-required="true">
                            @error('specialization')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset class="resume">
                            <div>
                                <div class="body-title "><span class="tf-color-1">*</span> السيرة الذاتية </div>
                                <input class="form-control form-control-lg fs-2" name="resume" id="formFileLg"
                                    type="file" accept="application/pdf">
                                @error('resume')
                                    <span class=" ">
                                        <p class="fs-4 alert alert-danger text-center">
                                            {{ $message }}
                                        </p>
                                    </span>
                                @enderror
                            </div>
                        </fieldset>
                    </fieldset>
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="license_number">
                            <div class="body-title"><span class="tf-color-1">*</span> رقم الرخصة</div>

                            <input class="flex-grow" type="text" placeholder="رقم الرخصة" name="license_number"
                                tabindex="0" value="{{ old('license_number') }}">
                            @error('license_number')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset class="license_expiry_date">
                            <div class="body-title"><span class="tf-color-1">*</span>تاريخ انتهاء الرخصة </div>
                            <input class="flex-grow" type="date" placeholde="ادخل تاريخ انتهاء الرخصة"
                                name="license_expiry_date" tabindex="0" value="{{ old('license_expiry_date') }}"
                                aria-required="true">
                            @error('license_expiry_date')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset class="password">
                            <div class="body-title"><span class="tf-color-1">*</span> كلمة المرور</div>

                            <input class="flex-grow" type="text" placeholder="ادخل كلمة المرور" name="password"
                                tabindex="0" value="{{ old('password') }}" aria-required="true">
                            @error('password')
                                <span class="">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                        <fieldset class="password">
                            <div class="body-title"><span class="tf-color-1">*</span> تأكيد كلمة المرور </div>

                            <input class="flex-grow" type="text" placeholder="تأكيد كلمة المرور"
                                name="confirm_password" tabindex="0" value="{{ old('confirm_password') }}"
                                aria-required="true">
                            @error('confirm_password')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                    </fieldset>

                    <fieldset class="name row">


                        <fieldset class="col">
                            <div class="item" id="imgpreview" style="display:none">
                                <img src="upload-1.html" class="effect8" alt="">
                            </div>
                        </fieldset>

                        <fieldset class="col">
                            <div class="body-title"><span class="tf-color-1">*</span> تحميل صورة المستخدم</div>
                            <div class="upload-image flex-grow">

                                <div id="upload-file" class="item up-load">
                                    <label class="uploadfile" for="myFile">
                                        <span class="icon">
                                            <i class="icon-upload-cloud"></i>
                                        </span>
                                        <span class="body-text">اسحب الصورة هنا أو <span class="tf-color">انقر
                                                للتصفح</span></span>
                                        <input type="file" id="myFile" name="image_url" accept="image/*"
                                            value="{{ old('image_url') }}">
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset class="col">
                            <div class="body-title"><span class="tf-color-1">*</span> تحميل صورة الرخصة</div>
                            <div class="upload-image flex-grow">
                                <div id="upload-file" class="item up-load">
                                    <label class="uploadfile" for="myFile2">
                                        <span class="icon">
                                            <i class="icon-upload-cloud"></i>
                                        </span>
                                        <span class="body-text">اسحب الصورة هنا أو <span class="tf-color">انقر
                                                للتصفح</span></span>
                                        @error('license_image')
                                            <span class=" ">
                                                <p class="fs-4 text-danger text-center">
                                                    {{ $message }}
                                                </p>
                                            </span>
                                        @enderror
                                        <input type="file" id="myFile2" name="license_image" accept="image/*">
                                    </label>
                                </div>

                            </div>
                        </fieldset>


                        <fieldset class="col">

                            <div class="item fs-1" id="imgpreview2" style="display:none">
                                <div class="body-title "> <span class="tf-color-1 p-2">*</span>الرخصة</div>
                                <img src="{{ old('license_image') }}" class="effect8 p-4" alt="">

                            </div>


                        </fieldset>

                    </fieldset>
                    @error('image_url')
                        <span class=" ">
                            <p class="fs-4 alert alert-danger text-center">
                                {{ $message }}
                            </p>
                        </span>
                    @enderror
                    <div class="bot " dir="ltr">

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
        $(function() {
            $("#myFile").on("change", function() {
                const photoInp = $("#myFile");
                const [file] = this.files
                if (file) {
                    $("#imgpreview img").attr('src', URL.createObjectURL(file));
                    $("#imgpreview").show();
                }
            });
            $("input[name='name']").on("change", function() {
                $("input[name='slug']").val(StringToSlug($(this).val()));
            });
        });

        function StringToSlug(Text) {
            return Text.toLowerCase().replace(/[^\w]+/g, "").replace(/ +/g, "-");

        }
        $(function() {
            $("#myFile2").on("change", function() {
                const photoInp = $("#myFile2");
                const [file] = this.files
                if (file) {
                    $("#imgpreview2 img").attr('src', URL.createObjectURL(file));
                    $("#imgpreview2").show();
                }
            });
            $("input[name='name']").on("change", function() {
                $("input[name='slug']").val(StringToSlug($(this).val()));
            });
        });

        function StringToSlug(Text) {
            return Text.toLowerCase().replace(/[^\w]+/g, "").replace(/ +/g, "-");

        }
    </script>
@endpush
