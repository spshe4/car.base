<div class="form-group">
	{!! Form::label('Название') !!}
	{!! Form::text('title',null,['class'=>'form-control']) !!}
</div>
<div class="form-group">
	{!! Form::label('Описание') !!}
	{!! Form::textarea('description',null,['class'=>'form-control']) !!}
</div>
<div class="form-group">
	{!! Form::label('Цена') !!}
	{!! Form::number('price',null,['class'=>'form-control']) !!}
</div>
<div class="form-group">
	{!! Form::checkbox('published',true,false) !!}
	{!! Form::label('Опубликовать') !!}
</div>
<div class="form-group">
	{!! Form::label('Дата публикации') !!}
	{!! Form::input('date','published_at',date('Y-m-d'),['class'=>'form-control']) !!}
</div>
<div class="form-group">
	{!! Form::label('Изображение') !!}
	{!! Form::file('images[]', ['multiple'=>true,'photo'=>'mimes:jpeg,bmp,png,gif|max:200']) !!}
</div>
