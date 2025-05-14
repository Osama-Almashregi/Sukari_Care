@extends('layouts.admin')

@section('content')
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>Comment infomation</h3>
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
                        <a href="{{route('admin.comments.index')}}">
                            <div class="text-tiny">Comments</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <div class="text-tiny">New Comment</div>
                    </li>
                </ul>
            </div>

            <!-- new-category -->
            <div class="wg-box" dir="rtl">
                <form class="form-new-product form-style-1" action="{{route('admin.comments.store_comment')}}"
                    enctype="multipart/form-data" method="POST">
                    @csrf
                    <fieldset class="name "> 
                        <div class="body-title fs-2"><span class="tf-color-1">*</span> المقال</div>
                        <select class="form-select fs-3 text-center " name="title" aria-label="اختر مقالًا">
                            @foreach ($blogs as $blog)
                                <option value="{{$blog->blog_id}}" class="fw-bold">{{$blog->title}}</option>
                            @endforeach
                        </select>
                        
                    </fieldset>
                        @error('title') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                 <fieldset class="comment">
                            <div class="body-title fs-2"><span class="tf-color-1">*</span>  اضف تعليق  </div>
                            <input class="flex-grow" type="text" placeholder=" ادخل تعليقك على المقال" name="comment" tabindex="0"
                                value="{{old('comment')}}" aria-required="true">
                        </fieldset>
                        @error('comment') <span class="alert alert-danger text-center">{{$message}}</span>@enderror
                       
                        
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