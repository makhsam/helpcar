@extends('layouts.frontLayout.front_design')
@section('content')

	<section id="form" style="margin-top: 20px;"><!--form-->
		<div class="container">
			<div class="row">
		@if(Session::has('flash_message_error')) 
          <div class="alert alert-danger alert-block">
              <button  type="button" class="close" data-dismiss="alert">x</button>
               <strong> {!! session('flash_message_error') !!}</strong>
          </div>
        @endif  
        @if(Session::has('flash_message_success')) 
          <div class="alert alert-success alert-block">
              <button  type="button" class="close" data-dismiss="alert">x</button>
               <strong> {!! session('flash_message_success') !!}</strong>
          </div>
        @endif 
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Update account</h2>
					    <form id="accountForm" name="accountForm" action="/account" method="POST">
							{{ csrf_field() }}

							<input value="{{ $userDetails->name }}" id="name" name="name" type="text" style="width:100%" placeholder="Name"/>
							<br>
							<input value="{{ $userDetails->email }}" id="email" name="email" type="email" style="width:100%" placeholder="Email"/>
							<br> <br>

							<button type="submit" class="btn btn-default">Update</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Update Password</h2>
						<form id="passwordForm" name="passwordForm" action="{{ url('/update-user-pwd') }}" method="POST">
						{{ csrf_field() }} 
							<input type="password" name="current_pwd" id="current_pwd" placeholder="Current Password">
							<span id="chkPwd"></span>
							<input type="password" name="new_pwd" id="new_pwd" placeholder="New Password">
							<input type="password" name="confirm_pwd" id="confirm_pwd" placeholder="Confirm Password">
							<button type="submit" class="btn btn-default">Update</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->

@endsection