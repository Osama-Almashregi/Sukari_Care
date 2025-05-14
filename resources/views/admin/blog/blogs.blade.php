@extends('layouts.admin')


@section('content')
<style>
    td {
        text-align: center;
        font-size: 30px;
        font-weight: bold;
    }
    th {
        text-align: center;
        font-size: 30px;
        font-weight: bold;
    }
</style>
<div class="main-content-inner">
    <div class="main-content-wrap">
        <div class="flex items-center flex-wrap justify-between gap20 mb-27">
            <h3>Blogs</h3>
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
                    <div class="text-tiny">Blogs</div>
                </li>
            </ul>
        </div>

        <div class="wg-box">
            <div class="flex items-center justify-between gap10 flex-wrap">
                <div class="wg-filter flex-grow">
                    <form class="form-search">
                    <fieldset class="name">
                        <div class="button-submit">
                            <button class="" type="submit"><i class="icon-search"></i></button>
                        </div>
                        <input type="text" placeholder="Search here..." class="" id="search-all-blogs" name="name"
                            tabindex="2" value="" aria-required="true" required="">
                    </fieldset>
                </form>
                </div>
                <a class="tf-button style-1 w208" href="{{route('admin.blog.add_blog')}}"><i
                        class="icon-plus"></i>Add new</a>
            </div>
            <div class="wg-table table-all-user">
                <div class="table-responsive">
                    @if(Session::has('status'))
                         <p class="alert alert-success">{{session::get('status')}}</p>
                    @endsession
                    <table class="table table-striped table-bordered text-center">
                        <thead class=" text-center">
                            <tr class="text-center">
                                <th class="text-center"> blog id</th>
                                <th class="text-center">title</th>
                                <th class="text-center">author</th>
                                <th class="text-center">created_at</th>
                                <th class="text-center">content</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="search-table">
                            @if (count($blogs) > 0)
                            @foreach ($blogs as $blog )

                            <tr>
                                <td class="text-center  ">{{$blog->blog_id}}</td>
                                <td class="pname">
                                    @if ($blog->image_url == null)
                                    <li class="icon">
                                        <i class="icon-book-open"></i>
                                    </li>
                                    @else
                                    <div class="image">
                                        <img src="{{asset('uploads/blogs/')}}/{{$blog->image_url}}" alt="{{$blog->title}}" class="image">
                                    </div>
                                    @endif
                                    <div class="name">
                                        <a href="#" class="body-title-2">{{$blog->title}}</a>
                                    </div>
                                </td>
                                <td>{{$blog->author->name}}</td>
                                <td>{{$blog->created_at}}</td>
                                <td>{{$blog->content}}</td>
                                <td>
                                    
                                    
                                    <div class="list-icon-function">
                                        
                                        @if ($blog->author_id == auth()->user()->id)
                                        <a href="{{route('admin.blog.edit_blog', ['id'=>$blog->blog_id])}}">
                                            <div class="item edit">
                                                <i class="icon-edit-3"></i>
                                            </div>
                                        </a>
                                        <form action="{{route('admin.blog.delete_blog', ['id'=>$blog->blog_id])}}" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <div class="item text-danger delete">
                                                <i class="icon-trash-2"></i>
                                            </div>
                                            {{-- need to favorite icon  --}}
                              
                                        </form>
                                        @endif
                                        {{-- @endif --}}
                                        @if ($blog->favorites()->where('user_id', auth()->user()->id)->exists())
                                        <img src="icon/heart-icon.svg" width="25px" > 
                                        @else
                                        <a href="{{route('admin.blog.favorite_blog', ['id'=>$blog->blog_id])}}">
                                            <img src="icon/heart-thin-icon.svg" width="25px" alt=""> 
                                        </a>
                                        @endif
                                    </div>
                                                
                                    
                                </td>
                            </tr>


                           @endforeach
                           @else
                           <tr>
                            <td class="text-center" colspan="6">No Blogs yet</td>
                           </tr>
                           @endif
                        </tbody>
                    </table>
                </div>
                <div class="divider"></div>
                <div class="flex items-center justify-between flex-wrap gap10 wgp-pagination">
                    {{$blogs->links('pagination::bootstrap-5')}}

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    $(function() {
        $('.delete').on('click', function(e) {
            e.preventDefault();
            var form = $(this).closest('form');
            Swal.fire({
                title: "Are you sure?",
                text: "You are about to delete this record!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#dc3545",
                confirmButtonText: "Yes, delete it!",
                cancelButtonText: "No, cancel!"
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        });
    });

    let old_content = $('.search-table').html();
    $(document).on('keyup', '#search-all-blogs', function() {
        var search_content = $(this).val();
        if (search_content != "") {
            $.ajax({
                url: '/admin-blog-search',
                method: "GET",
                dataType: "json",
                data: { search_content},
                success: function(data) {
                    $('.search-table').html(data.row_result);
                                }   
            });
        } else {
            $('.search-table').html(old_content);
        } 
    });
</script>
    @endpush