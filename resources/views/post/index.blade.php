@extends('app')

@section('content')
	<div>
		{!! link_to_route('posts','Каталог') !!}

		@if($user_id>0)
			&nbsp;&nbsp;&nbsp; {!! link_to_route('posts.account','Мои автомобили') !!} &nbsp;&nbsp;&nbsp; {!! link_to_route('post.create','Создать новый') !!}
		@endif

	</div>

	@if(count($posts)==0)
		<div class="empty-list">Нет автомобилей в данном разделе</div>
	@else
		@foreach($posts as $post)
			<article class="box-style">
				<h2>{!! link_to_route('post.show',$post->title,$post->id) !!}</h2>
				<div class="row">
					<div class="col-sm-4">
						@if($post['img']!='')
				  			<img class="img-style" src="/images/{{$post['img']}}"/>
				  		@else
				  			<img class="img-style" src="/images/car.png"/>
				  		@endif
				  	</div>
					<div class="col-sm-8">
					  	<p>
							{!!$post->description!!}
						</p>
						<p>
							Цена: <b>{!! $post->price !!}</b>
						</p>
						<p>
							Публикация: {!!$post->published_at!!} 
							@if($user_id==$post->user_id)
							 	| {!! link_to_route('post.edit','Редактировать',$post->id) !!}
							@endif
						</p>
				  	</div>
				</div>
			</article>
		@endforeach

		<div class="text-center">
			{!! $posts->render() !!}
		</div>
	@endif
@stop