@extends('layouts.admin')


@section('content')
<style>
     .btn {
        font-size: 12px; /* زيادة حجم الخط للأزرار */
        padding: 5px 7px;
        border-radius: 5px; /* تكبير الأزرار */
    }
    .swal2-title {
        
        font-size: 20px; /* زيادة حجم عنوان الرسالة */
    }
    .swal2-content {
        font-size: 22px; /* زيادة حجم نص الرسالة */
    }
    .swal2-confirm, .swal2-cancel {
        font-size: 18px; /* زيادة حجم الخط للأزرار في النافذة المنبثقة */
    }
</style>
<div class="main-content-inner">
    <div class="main-content-wrap">
        <div class="flex items-center flex-wrap justify-between gap20 mb-27">
            <h3>Users</h3>
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
                    <div class="text-tiny">Users</div>
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
                            <input type="text" placeholder="Search here..." class="" id="search-all-users" name="name"
                                tabindex="2" value="" aria-required="true" required="">
                        </fieldset>
                    </form>
                </div>
                <a class="tf-button style-1 w208" href="{{route('admin.user.add_user')}}"><i
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
                                <th class="text-center"> User id</th>
                                <th class="text-center">User name</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Role</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="search-table">

                            
                            @foreach ($users as $user )
                            <tr >
                                <td class="text-center">{{$user->id}}</td>
                                <td class="text-center">
                                    <div class="image">
                                        @if ($user->profile != null && $user->profile->image_url != null)
                                        <img src="{{asset('uploads/doctors/')}}/{{$user->profile->image_url}}" alt="" class="image">
                                        @else
                                        <img src="{{asset('uploads/doctors/user.svg')}}" class="image">
                                        @endif
                                    </div>
                                    <div class="name">
                                        <a href="#" class="body-title-2">{{$user->name}}</a>
                                    </div>
                                </td>
                                <td class="text-center">{{$user->email}}</td>
                                <td class="text-center">
                                    @if ($user->role == null)
                                    <form action="{{route('admin.user.update_role')}}" method="POST">
                                        @csrf
                                        <div class=" flex items-center justify-center gap-10">
                                            <input type="hidden" name="user_id" value="{{$user->id}}">
                                            <div class="flex items-center justify-center p-2 ">
                                                <select name="role" class="form-select p-6 m-2 rounded-lg text-2xl px-10">
                                                    <option value="admin">Admin</option>
                                                    <option value="doctor">Doctor</option>
                                                    <option value="patient">Patient</option>
                                                    <option value="relative">Relative</option>
                                                </select>
                                            </div>
                                            <div class="flex items-center justify-center ">
                                                <button type="submit" class="tf-button ">Save</button>

                                            </div>
                                        </div>
                                    </form>
                                    @else
                                    {{$user->role}}
                                    
                                    @endif
                                </td>
                                {{-- <td class="text-center">{{$user->blog->content}}</td> --}}
                                <td class="text-center">
                                    <div class="list-icon-function">
                                        <a href="{{route('admin.user.edit_user', $user->id)}}">
                                            <div class="item edit">
                                                <i class="icon-edit-3"></i>
                                            </div>
                                        </a>
                                        <form action="{{route('admin.user.delete_user', $user->id)}}" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <div class="item text-danger delete">
                                                <i class="icon-trash-2"></i>
                                            </div>
                                        </form>
                                       
                                      <!-- إضافة الأزرار مع رسالة تأكيد -->
                                             @if ($user->status == 'active')
                                                <a href="{{ route('user.status.update', ['user_id' => $user->id, 'status_code' => 'suspend']) }}"
                                                class="btn btn-danger m-2 p-2 confirm-action">
                                                    Suspend
                                                </a>
                                            @else
                                                <a href="{{ route('user.status.update', ['user_id' => $user->id, 'status_code' => 'active']) }}"
                                                class="btn btn-success m-2 confirm-action">
                                                    Active
                                                </a>
                                            @endif
                                    </div>
                                </td>
                            </tr>
                            @if ($user==null)
                            <tr>
                                <td colspan="6">
                                    <p class="text-center">No data found</p>
                                </td>
                            </tr>
                            @endif
                            @endforeach
                        </div>
                        </tbody>
                    </table>
                </div>
                <div class="divider"></div>
                <div class="flex items-center justify-between flex-wrap gap-10 wgp-pagination">
                    {{$users->links('pagination::bootstrap-5')}}

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    let old_content = $('.search-table').html();
    $(document).on('keyup', '#search-all-users', function() {
        var search_content = $(this).val();
        if (search_content != "") {
            $.ajax({
                url: '/admin-user-search_user',
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
   
    $(function() {
    $('.confirm-action').on('click', function(e) {
        e.preventDefault(); // منع الإجراء الافتراضي
        var url = $(this).attr('href'); // الحصول على الرابط
        
        Swal.fire({
            title: "تحذير!",
            text: "هل أنت متأكد أنك تريد تنفيذ هذا الإجراء؟",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#dc3545",
            confirmButtonText: "نعم، تابع!",
            cancelButtonText: "لا، إلغاء!",
            customClass: {
                confirmButton: 'swal-confirm',
                cancelButton: 'swal-cancel'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = url; // إعادة التوجيه إذا تم التأكيد
            }
        });
    });
});
</script>
    @endpush