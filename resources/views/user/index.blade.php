@extends('layouts.app')

@section('content')
user dashpord
<form method="POST" action="{{route('logout')}}"  class="logout-form">
    @csrf
    <a href="{{route('logout')}}" onclick="event.preventDefault(); this.closest('form').submit();">Logout</a>
</form>
@endsection
@push('scripts')
@endpush