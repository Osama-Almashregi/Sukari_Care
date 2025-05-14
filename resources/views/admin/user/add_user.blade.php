@extends('layouts.admin')

@section('content')
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>New User</h3>
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
                        <div class="text-tiny">New Users</div>
                    </li>
                </ul>
            </div>

            <!-- new-category -->
            <div class="wg-box" dir="rtl">
                <form class="form-new-product form-style-1" action="{{route('admin.user.store_user')}}"
                    enctype="multipart/form-data" method="POST">
                    @csrf
                    <fieldset class="name">
                        <div class="body-title"><span class="tf-color-1">*</span>  اسم المستخدم   </div>
                        <input class="flex-grow" type="text" placeholder="ادخل اسم المستخدم" name="name" tabindex="0"
                        value="{{old('email')}}" aria-required="true">
                    </fieldset>
                        @error('name') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span>  البريد الالكتروني  </div>
                            <input class="flex-grow" type="email" placeholder="ادخل البريد الالكتروني" name="email" tabindex="0"
                                value="{{old('email')}}" aria-required="true">
                            </fieldset>
                            @error('email') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                            <fieldset class="role">
                                <div class="body-title"><span class="tf-color-1">*</span>  نوع المستخدم</div>
                                <select class="form-select text-center" name="role">
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
                                value="{{old('password')}}" aria-required="true">
                        </fieldset>
                        @error('password') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span>  تأكيد كلمة المرور  </div>
                            <input class="flex-grow" type="password" placeholder="تاكيد كلمة المرور" name="confirm_password" tabindex="0"
                                value="{{old('confirm_password')}}" aria-required="true">
                        </fieldset>
                        @error('confirm_password') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
              
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
                @error('image') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
         
                        
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