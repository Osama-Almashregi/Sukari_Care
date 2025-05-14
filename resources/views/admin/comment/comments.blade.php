@extends('layouts.admin')


@section('content')

<div class="main-content-inner">
    <div class="main-content-wrap">
        <div class="flex items-center flex-wrap justify-between gap20 mb-27">
            <h3>Comments</h3>
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
                    <div class="text-tiny">Comments</div>
                </li>
            </ul>
        </div>

        <div class="wg-box">
            <div class="flex items-center justify-between gap10 flex-wrap">
                <div class="wg-filter flex-grow">
                    <form class="form-search">
                        <fieldset class="name">
                            <input type="text" placeholder="Search here..." class="" name="name"
                                tabindex="2" value="" aria-required="true" required="">
                        </fieldset>
                        <div class="button-submit">
                            <button class="" type="submit"><i class="icon-search"></i></button>
                        </div>
                    </form>
                </div>
                <a class="tf-button style-1 w208" href="{{route('admin.comments.add_comment')}}"><i
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
                                <th class="text-center"> Conment id</th>
                                <th class="text-center">Blog title</th>
                                <th class="text-center">author</th>
                                <th class="text-center">comments blog have</th>
                                
                                <th class="text-center">Blog title</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($comments as $comment )
                            <tr>
                                <td class="text-center">{{$comment->comment_id}}</td>
                                <td class="text-center">
                                    <div class="image">
                                        @if ($comment->blog->image_url == null)
                                        <li class="icon">
                                            <i class="icon-book-open"></i>
                                        </li>
                                        @else
                                        <img src="{{asset('uploads/blogs/')}}/{{$comment->blog->image_url}}" alt="{{$comment->author->name}}" class="image">
                                        @endif
                                    </div>
                                        <div class="name">
                                            <a href="#" class="body-title-2">{{$comment->blog->title}}</a>
                                        </div>
                                </td>
                                <td class="text-center">{{$comment->author->name}}</td>
                                <td class="text-center">{{$comment->where('blog_id', $comment->blog_id)->count()}}</td>
                                <td class="text-center">{{$comment->comment}}</td>
                                <td class="text-center">
                                    <div class="list-icon-function">
                                        @if ($comment->user_id ==Auth::user()->id)
                                        
                                        <a href="{{route('admin.comments.edit_comment', ['id'=>$comment->comment_id])}}">
                                            <div class="item edit">
                                                <i class="icon-edit-3"></i>
                                            </div>
                                        </a>
                                        <form action="{{route('admin.comments.delete_comment', ['id'=>$comment->comment_id])}}" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <div class="item text-danger delete">
                                                <i class="icon-trash-2"></i>
                                            </div>
                                        </form>
                                        @endif
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="divider"></div>
                <div class="flex items-center justify-between flex-wrap gap10 wgp-pagination">
                    {{$comments->links('pagination::bootstrap-5')}}

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
</script>
    @endpush