@extends('app')

@section('content')
	@if($user_id==$post->user_id) 
		<div>
			{!! link_to_route('posts','Каталог') !!} &nbsp;&nbsp;&nbsp; {!! link_to_route('posts.account','Мои автомобили') !!} &nbsp;&nbsp;&nbsp; {!! link_to_route('post.create','Создать новый') !!}
		</div>
		<h1>Редактирование</h1>
			{!! Form::model($post,['method'=>'PATCH','route'=>['post.update',$post->id],'files' => true]) !!}
				@include('post._form')

				<div class="block-images">
					@foreach($imgs as $img)
						<img class="img-style" src="/images/{{$img->name}}"/>
					@endforeach
				</div>

				<div class="form-group">
					{!! Form::submit('Сохранить изменения',['class'=>'btn btn-primary']) !!}
				</div>
			{!! Form::close()!!}
	@else
		<div>
			{!! link_to_route('posts','Каталог') !!}
		</div>
		<div>У вас нет доступа к редактированию этого поста</div>
	@endif
@endsection