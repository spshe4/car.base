@extends('app')

@section('content')
	<?php $user_id = session('id'); ?>
	@if($user_id > 0)
		<div>
			{!! link_to_route('posts','Каталог') !!} &nbsp;&nbsp;&nbsp; {!! link_to_route('posts.account','Мои автомобили') !!} &nbsp;&nbsp;&nbsp; {!! link_to_route('post.create','Создать новый') !!}
		</div>
		<h1>Создать пост</h1>
		{!! Form::open(['route'=>'post.store','files' => true]) !!}
			@include('post._form')
			<div class="form-group">
				{!! Form::submit('Создать',['class'=>'btn btn-primary']) !!}
			</div>
		{!! Form::close()!!}
	@else
		<div>Чтобы создать пост, необходимо авторизоваться или зарегистрироваться</div>
	@endif
@endsection