@extends('index')

@section('title')
    Register
@endsection

@section('content')
<body class="img js-fullheight" style="background-image: url({{asset('login/images/hero-bg.jpg')}});">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<img width="40%" src="{{asset('login/images/logo.png')}}" alt="">
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Creat New Account</h3>
				  	@if (Session::has('success'))
				  		<div class="alert alert-success" role="alert">
						 {{ Session::get('success')}}
				  		</div>
			  		@endif
		      	<form action="" class="signin-form" method="POST">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Name" required name="name">
					</div>
					@error('name')
                        <span style="color: red"> {{$message}}</span>
                        <br>
                    @enderror

					<div class="form-group">
						<input type="text" class="form-control" placeholder="Email" required name="email">
					</div>
					@error('email')
                      <span style="color: red"> {{$message}}</span>
                      <br>
                    @enderror

					<div class="form-group">
						<input id="password-field" type="password" class="form-control" placeholder="Password" required name="password">
						<span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
					</div>
					@error('password')
                      <span style="color: red"> {{$message}}</span>
                      <br>
                    @enderror 
					
					<div class="form-group">
						<input type="Password" class="form-control" placeholder="Confirm Password" required name="confirm_password">
					</div>
					<div class="form-group">
						<button type="submit" class="form-control btn btn-primary submit px-3">Sign up</button>
					</div>
					@csrf
	         	</form>
              <a href="{{route('login')}}"> <p class="w-100 text-center" style="color: white">&mdash;  Sign In  &mdash;</p></a>
	          
	          
              
		      </div>
				</div>
			</div>
		</div>
	</section>

    <script src="{{asset('login/js/jquery.min.js')}}"></script>
    <script src="{{asset('login/js/popper.js')}}"></script>
    <script src="{{asset('login/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('login/js/main.js')}}"></script>

	</body>
@endsection