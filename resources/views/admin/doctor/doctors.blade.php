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
            <h3>Doctors</h3>
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
                    <div class="text-tiny">Doctors</div>
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
                        <input type="text" placeholder="Search here..." class="" id="search-all-doctors" name="name"
                            tabindex="2" value="" aria-required="true" required="">
                    </fieldset>
                </form>
                </div>
                <a class="tf-button style-1 w208" href="{{route('admin.doctors.add_doctor')}}"><i
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
                                <th class="text-center">doctor id</th>

                                <th>Name</th>
                                <th>firstname[lastname]</th>
                                <th>Email</th>
                                
                                <th>Status</th>
                                <th>Show Cv</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody class="search-table">
                            @foreach ($doctors as $doctor )

                            <tr>
                                <td class="text-center  ">{{$doctor->id}}</td>
                                <td class="pname">
                                @if ($doctor->user->profile == null)
                                <img src="{{asset('uploads/doctors/default.svg')}}" alt="{{$doctor->user->name}}" class="image">
                                @else
                                    <div class="image">
                                        <img src="{{asset('uploads/doctors/')}}/{{$doctor->user->profile->image_url}}" alt="{{$doctor->user->name}}" class="image">
                                    </div>
                                @endif
                                
                                    <div class="name">
                                        <a href="#" class="body-title-2">{{$doctor->user->name}}</a>
                                    </div>
                                </td>
                                <td>
                                    @if ($doctor->user->profile == null)
                                    -
                                    @else
                                    {{$doctor->user->profile->first_name}} {{$doctor->user->profile->last_name}}
                                    @endif
                                </td>
                                <td>{{$doctor->user->email}}</td>
                                
                                <td><a href="#" target="_blank">{{$doctor->status}}</a></td>
                                <td>
                                    @if ($doctor->resume == null)
                                    <div class="item text-danger">
                                        No Cv
                                    </div>
                                    @else
                                    <a href="{{url('uploads/doctors/cv')}}/{{$doctor->resume}}">
                                        <div class="item text-primary">
                                            show Cv
                                        </div>
                                    </a>
                                    @endif
                                    
                                </td>
                                <td>
                                    <div class="list-icon-function">
                                        <a href="{{route('admin.doctors.edit_doctor', $doctor->id)}}">
                                            <div class="item edit">
                                                <i class="icon-edit-3"></i>
                                            </div>
                                        </a>
                                        <form action="{{route('admin.doctors.delete_doctor', $doctor->id)}}" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <div class="item text-danger delete">
                                                <i class="icon-trash-2"></i>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="divider"></div>
                <div class="flex items-center justify-between flex-wrap gap10 wgp-pagination">
                    {{$doctors->links('pagination::bootstrap-5')}}

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
    $(document).on('keyup', '#search-all-doctors', function() {
        var search_content = $(this).val();
        if (search_content != "") {
            $.ajax({
                url: 'admin-user-search_doctor',
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