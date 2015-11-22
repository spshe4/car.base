@extends('app')

@section('content')
	
	<div>
		{!! link_to_route('posts','Каталог') !!}
		@if($user_id>0)
		 	&nbsp;&nbsp;&nbsp; {!! link_to_route('posts.account','Мои автомобили') !!} &nbsp;&nbsp;&nbsp; {!! link_to_route('post.create','Создать новый') !!}
		@endif
	</div>

	<article>
		<h2>{!!$post->title!!}</h2>
		@if($user_id==$post->user_id)
			<p class="text-right">
				{!! link_to_route('post.edit','Редактировать',$post->id) !!}
			</p>
		@endif
		<p>
			{!!$post->description!!}
		</p>
		<p>
			Цена: <b>{!! $post->price !!}</b>
		</p>
		<p>
			Публикация: {!!$post->published_at!!}
		</p>

		<div class="block-images">
			@if(count($imgs)>0)
				@foreach($imgs as $img)
					<img class="img-style" src="/images/{{$img->name}}"/>
				@endforeach
			@else
				<div>- изображений нет -</div>
			@endif
		</div>

		@if($user_id==$post->user_id)

			<div class="col-md text-right">
		        {!! Form::open([
		            'method' => 'DELETE',
		            'route' => ['post.destroy', $post->id]
		        ]) !!}
		            {!! Form::submit('Удалить пост', ['class' => 'btn btn-danger']) !!}
		        {!! Form::close() !!}
		    </div>
		@endif

	</article>
@stop