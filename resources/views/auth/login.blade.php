@include('auth.header')
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-lg" style="width: 100%; max-width: 400px;">
        <div class="card-header text-center">{{ __('Login') }}</div>
        <div class="card-body">
            @if ((Session::has('error')))
                <p class="alert alert-danger">{{Session::get('error')}}</p>
              
            @endif
            <form method="POST" action="{{ route('login') }}">
                @csrf
                <div class="mb-3">
                    <label for="email" class="form-label">{{ __('Email Address') }}</label>
                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                    @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="mb-3 position-relative">
                    <label for="password" class="form-label">{{ __('Password') }}</label>
                    <span class="position-absolute" style="right: 10px; top: 70%; transform: translateY(-50%); cursor: pointer;" onclick="togglePassword()">
                        <i id="toggle-icon" class="fas fa-eye"></i>
                    </span>
                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">
                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="pb-3 py-2">
                    <input class="rounded-lg mr-2 text-blue-600 " type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                    <label class="text-blue-600" for="remember">{{ __('Remember Me') }}</label>
                </div>

                <div class="d-flex justify-content-between w-full">
                    <button type="submit" class="w-full">
                        <div class="bg-green-500 px-7 py-2 font-bold text-white rounded-lg  hover:bg-green-400 hover:text-primary">
                            {{ __('login') }}

                        </div>
                    </button>
                </div>
                <div class="text-blue-600 my-4 d-flex justify-content-between">
                    @if (Route::has('password.request'))
                    <a class="btn btn-link" href="{{ route('password.request') }}">{{ __('Forgot Your Password?') }}</a>
                @endif
                    <a href="{{ route('register') }}">
                        <span class="text-center text-blue-600 mt-10">
                            I don't have an account
                        </span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const toggleIcon = document.getElementById('toggle-icon');
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }
</script>