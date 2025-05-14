@extends('layouts.admin')

@section('content')
<style>
    /* أنماط الصورة المكبرة */
    .modal {
        display: none; /* إخفاء العنصر بشكل افتراضي */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.8);
        justify-content: center;
        align-items: center;
    }
    .modal img {
        max-width: 90%;
        max-height: 90%;
    }
    .close {
        position: absolute;
        top: 20px;
        right: 30px;
        color: white;
        font-size: 30px;
        cursor: pointer;
    }
</style>
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>Edit Doctor Information</h3>
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
                        <div class="text-tiny">Edit Doctor</div>
                    </li>
                </ul>
            </div>
    
            <!-- عنصر تكبير الصورة -->
            <div class="modal" id="modal">
                <span class="close" id="close">&times;</span>
                <img src="{{ asset('images/not_found.png') }}" id="modalImage" alt="تكبير الصورة">
            </div>

            <!-- new-category -->
            <div class="wg-box" dir="rtl">
                <form class="form-new-product form-style-1" action="{{ route('admin.doctors.update_doctor', $doctor->id) }}"
                    enctype="multipart/form-data" method="POST">
                    @method('PUT')
                    @csrf
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="name w-full">
                            <div class="body-title"><span class="tf-color-1">*</span> اسم المستخدم </div>
                            <input class="" type="text" placeholder="اسم المستخدم" name="name" tabindex="0"
                                value="{{ $doctor->user->name }}" aria-required="true">
                            @error('name')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>
                        <input type="hidden" name="role" value="doctor">
                        <fieldset class="email">
                            <div class="body-title"><span class="tf-color-1">*</span> الربيد الالكتروني </div>
                            <input class="flex-grow" type="text" placeholder="الربيد الالكتروني" name="email"
                                tabindex="0" value="{{ $doctor->user->email }}" aria-required="true">
                            @error('email')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>
                        @if ($doctor->resume == null)
                            <fieldset class="resume">
                                <div>
                                    <div class="body-title"><span class="tf-color-1">*</span> السيرة الذاتية </div>
                                    <input class="form-control form-control-lg" value="{{ $doctor->resume }}" name="resume"
                                        id="formFileLg" type="file">

                                </div>
                                @error('resume')
                                    <span class="alert alert-danger text-center"> {{$message }}</span>
                                @enderror
                            </fieldset>
                        @else
                            <fieldset class="resume">
                                <div>
                                    <div class="body-title text-right"><span class="tf-color-1 ">*</span>
                                        <a href="{{ url('uploads/doctors/cv/' . $doctor->resume) }}">
                                            تحميل السيرة الذاتية
                                        </a>
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset class="resume">
                                <div>
                                    <div class="body-title"><span class="tf-color-1">*</span> تغيير السيرة الذاتية </div>
                                    <input class="form-control form-control-lg" value="{{ $doctor->resume }}"
                                        name="resume" id="formFileLg" type="file">
                                </div>
                                @error('resume')
                                    <span class="alert alert-danger text-center">{{ $message }}</span>
                                @enderror
                            </fieldset>
                        @endif
                    </fieldset>
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="name w-full">
                            <div class="body-title"><span class="tf-color-1">*</span> الاسم الاول </div>
                            <input class="" type="text" placeholder="الاسم الاول " name="first_name" tabindex="0"
                                value="{{ $doctor->user->profile->first_name }}" aria-required="true">
                            @error('first_name')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>
                        <input type="hidden" name="role" value="doctor">
                        <fieldset class="last_name">
                            <div class="body-title"><span class="tf-color-1">*</span> الاسم الثاني </div>
                            <input class="flex-grow" type="text" placeholder="الاسم الثاني " name="last_name"
                                tabindex="0" value="{{ $doctor->user->profile->last_name }}" aria-required="true">
                            @error('last_name')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>
                        <fieldset class="date_of_birth">
                            <div class="body-title"><span class="tf-color-1">*</span>تاريخ الميلاد </div>
                            <input class="flex-grow" type="date"  placeholder="ادخل تاريخ الميلاد" name="date_of_birth" min="1880-01-01" max="2000-12-31"
                                tabindex="0" value="{{ $doctor->user->profile->date_of_birth }}" aria-required="true">
                            @error('date_of_birth')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>
                    </fieldset>

                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="name">
                            <div class="body-title mb-10"><span class="tf-color-1 fs-3">*</span> الحالة</div>
                            <div class=" mb-10">
                                <select class="form-select text-center fs-1" name="status">
                                    <option class="fs-3" value="{{ $doctor->status }}">
                                        @if ($doctor->status == 'active')
                                            نشيط
                                        @endif
                                        @if ($doctor->status == 'paused')
                                            موقف
                                        @endif

                                    </option>
                                    <option class="fs-3" value="active">نشيط</option>
                                    <option class="fs-3" value="paused">موقف</option>
                                </select>
                            </div>
                            @error('status')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>
                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span> التخصص </div>

                            <input class="flex-grow" type="text" placeholder="ادخل التخصص" name="specialization"
                                tabindex="0" value="{{ $doctor->specialization }}" aria-required="true">
                            @error('specialization')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>
                        <fieldset class="license_number">
                            <div class="body-title"><span class="tf-color-1">*</span> رقم الرخصة</div>

                            <input class="flex-grow" type="text" placeholder="رقم الرخصة" name="license_number"
                                tabindex="0" value="{{$doctor->license_number}}">
                            @error('license_number')
                                <span class=" ">
                                    <p class="fs-4 alert alert-danger text-center">
                                        {{ $message }}
                                    </p>
                                </span>
                            @enderror
                        </fieldset>
                    </fieldset>
                    
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset class="license_expiry_date">
                            <div class="body-title"><span class="tf-color-1">*</span>تاريخ انتهاء الرخصة </div>
                            <input dir="ltr" class="flex-grow" type="date" placeholde="ادخل تاريخ انتهاء الرخصة"
                            min="{{ Carbon\Carbon::now()->format('d-m-y') }}"
                                name="license_expiry_date" tabindex="0" value="{{ $doctor->license_expiry_date }}"
                                aria-required="true">
                            @error('license_expiry_date')
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
                                tabindex="0" value="{{ $doctor->user->profile->contact_info }}" aria-required="true">
                            @error('contact_info')
                                <span class="alert alert-danger text-center">{{ $message }}</span>
                            @enderror
                        </fieldset>

                    </fieldset>
                    <fieldset class="name grid grid-cols-2 gap-10">
                        <fieldset>
                            <div class="body-title"><span class="tf-color-1">*</span> تعديل صورة الرخصة</div>
                            <div class="upload-image flex-grow">
                                @if ($doctor->license_image)
                                    <div class="item shadow p-3 mb-5 bg-body-tertiary rounded" id="imgpreview2">
                                        <img src="{{ asset('uploads/doctors/licenses') }}/{{ $doctor->license_image }}" id="thumbnailLicense"
                                            class="effect8" alt="{{ $doctor->user->name }}" style="cursor: pointer;">
                                    </div>
                                @else
                                    <div class="shadow p-3 mb-5 bg-body-tertiary rounded" id="imgpreview2">
                                        <img src="{{ asset('images/not_found.png') }}" class="effect8 p-4"
                                            alt="{{ $doctor->user->name }}" style="cursor: pointer;">
                                    </div>
                                @endif
                    
                                <div id="upload-file" class="item up-load shadow p-3 mb-5 bg-body-tertiary ">
                                    <label class="uploadfile" for="myFile2">
                                        <span class="icon">
                                            <i class="icon-upload-cloud"></i>
                                        </span>
                                        <span class="body-text">اسحب الصورة هنا أو <span class="tf-color">انقر
                                            للتصفح</span></span>
                                        <input type="file" id="myFile2" name="license_image" accept="image/*">
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                    
                        <fieldset>
                            <div class="body-title"><span class="tf-color-1">*</span> تعديل صورة المستخدم</div>
                            <div class="upload-image flex-grow">
                                @if ($doctor->user->profile->image_url)
                                    <div class="item shadow p-3 mb-5 bg-body-tertiary rounded" id="imgpreview">
                                        <img src="{{ asset('uploads/doctors') }}/{{ $doctor->user->profile->image_url }}" id="thumbnailUser"
                                            class="effect8" alt="{{ $doctor->user->name }}" style="cursor: pointer;">
                                    </div>
                                @else
                                    <div class="shadow p-3 mb-5 bg-body-tertiary rounded" id="imgpreview2">
                                        <img src="{{ asset('images/not_found.png') }}" class="effect8 p-4" alt="{{ $doctor->user->name }}" style="cursor: pointer;">
                                    </div>
                                @endif
                    
                                <div id="upload-file" class="item up-load shadow p-3 mb-5 bg-body-tertiary ">
                                    <label class="uploadfile" for="myFile">
                                        <span class="icon">
                                            <i class="icon-upload-cloud"></i>
                                        </span>
                                        <span class="body-text">اسحب الصورة هنا أو <span class="tf-color">انقر
                                            للتصفح</span></span>
                                        <input type="file" id="myFile" name="image_url" accept="image/*">
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                    </fieldset>
                    
                    <!-- نافذة تكبير الصورة -->
                    <div class="modal" id="modal" style="display: none;">
                        <span class="close" id="close">&times;</span>
                        <img src="" id="modalImage" alt="تكبير الصورة" style="max-width: 90%; max-height: 90%;">
                    </div>
                    
                    @error('image')
                        <span class="alert alert-danger text-center">{{ $message }}</span>
                    @enderror
                    </fieldset>
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
    const thumbnails = document.querySelectorAll('#imgpreview img, #imgpreview2 img');
    const modal = document.getElementById('modal');
    const modalImage = document.getElementById('modalImage');
    const close = document.getElementById('close');

    thumbnails.forEach(thumbnail => {
        thumbnail.onclick = function() {
            modal.style.display = 'flex';
            modalImage.src = this.src; // تغيير مصدر الصورة المكبرة
        }
    });

    close.onclick = function() {
        modal.style.display = 'none';
    }

    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    }
</script>

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
        $(function () {
            $("#myFile2").on("change", function () {
                const photoInp = $("#myFile2");
                const [file] = this.files
                if (file) {
                    $("#imgpreview2 img").attr('src', URL.createObjectURL(file));
                    $("#imgpreview2").show();
                }
            });
            $("input[name='name']").on("change", function () {
                $("input[name='slug']").val(StringToSlug($(this).val()));
            });
        });

    </script>
@endpush

<style>
    .modal {
        display: flex; /* إظهار العنصر */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.8);
        justify-content: center;
        align-items: center;
    }
    .close {
        position: absolute;
        top: 20px;
        right: 30px;
        color: white;
        font-size: 30px;
        cursor: pointer;
    }
</style>
