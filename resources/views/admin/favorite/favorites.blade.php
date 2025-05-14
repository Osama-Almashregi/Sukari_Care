@extends('layouts.admin')


@section('content')
<style>
    td {
        text-align: center;
        font-size: 30px;
        font-weight: bold;
    }
</style>
<div class="main-content-inner">
    <div class="main-content-wrap">
        <div class="flex items-center flex-wrap justify-between gap20 mb-27">
            <h3>Favorites</h3>
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
                    <div class="text-tiny">Favorites</div>
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
                        <input type="text" placeholder="Search here..." class="" id="search-all-blog_favorites" name="name"
                            tabindex="2" value="" aria-required="true" required="">
                    </fieldset>
                </form>
                </div>
            </div>
            <div class="wg-table table-all-user">
                <div class="table-responsive">
                    @if(Session::has('status'))
                         <p class="alert alert-success">{{session::get('status')}}</p>
                    @endsession
                    <table class="table table-striped table-bordered text-center">
                        <thead class=" text-center">
                            <tr class="text-center">
                                <th class="text-center"> Favorite id</th>
                                <th class="text-center">Blog title</th>
                                <th class="text-center">arthor</th>
                                <th class="text-center">Created_at</th>
                                <th class="text-center">content</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="search-table">

                            @if (count($blogs)>0)
                            @foreach($blogs as $blog)
                            <tr class="">
                                <td>{{$blog->id}}</td>
                                <td>{{$blog->blog->title}}</td>
                                <td>{{$blog->blog->author->name}}</td>
                                <td>{{$blog->created_at->format('Y-m-d')}}</td>
                                <td>{{$blog->blog->content}}</td>
                                <td>    
                                   
                                    <div class="">
                                        <form action="{{route('admin.favorites.destroy',['id'=>$blog->id])}}" method="post">
                                            @csrf 
                                            @method('DELETE')
                                            <button  type="submit">
                                                <img src="icon/heart-icon.svg"  width="25px" alt=""> 
                                            </button>
                                        </form>
                                    </div>  
                                 
                                </td>
                                
                            </tr>
                            @endforeach
                            @else
                            <tr>
                                <td class="text-center" colspan="7">No Favorites</td>
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
    $(document).on('keyup', '#search-all-blog_favorites', function() {
        var search_content = $(this).val();
        if (search_content != "") {
            $.ajax({
                url: '/admin-favorite-search',
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