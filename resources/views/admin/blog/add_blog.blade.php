@extends('layouts.admin')

@section('content')
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>Blog infomation</h3>
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
                        <a href="{{route('admin.blog.index')}}">
                            <div class="text-tiny">Blogs</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <div class="text-tiny">New Blogs</div>
                    </li>
                </ul>
            </div>

            <!-- new-category -->
            <div class="wg-box" dir="rtl">
                <form class="form-new-product form-style-1" action="{{route('admin.blog.store_blog')}}"
                    enctype="multipart/form-data" method="POST">
                    @csrf
                        <fieldset class=" w-full">
                            <div class="body-title"><span class="tf-color-1">*</span> العنوان  </div>
                            <input class="" type="text" placeholder="العنوان " name="title" tabindex="0"
                                value="{{old('title')}}" aria-required="true">
                        </fieldset>
                        @error('title') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        <fieldset class="name">
                            <div class="body-title"><span class="tf-color-1">*</span> عنوان ثانوي</div>
                            <input class="flex-grow" type="text" placeholder="عنوان ثانوي " name="slug" tabindex="0"
                                value="{{old('slug')}}" aria-required="true">
                        </fieldset>
                        @error('slug') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                        <fieldset class="content">
                            <div class="body-title"><span class="tf-color-1">*</span> محتوى المقال  </div>
                            <textarea class="flex-grow" type="text" placeholder=" ادخل محتوى المقال" name="content" tabindex="0"
                                 aria-required="true">
                             {{old('content')}}</textarea>
                        </fieldset>
                        @error('content') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                      
                
         <div class="body-title"><span class="tf-color-1">*</span> تحميل صورة المقال</div>
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