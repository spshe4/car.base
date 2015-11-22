<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Post extends Model
{

	protected $fillable = ['user_id','title', 'description', 'price', 'published', 'published_at'];
    protected $quarded = ['id','created_at','updated_at'];

    public function getPublishedPosts(){
    	$posts = $this->latest('id')->published()->paginate(5);

        return $posts;
    }

    public function getPublishedMyPosts(){
        $posts = $this->latest('id')->myPublished()->paginate(5);

        return $posts;
    }

    public function scopeMyPublished($query){
        $user_id = session('id');
        $query->where('published_at','<=',Carbon::now())
            ->where('published','=',1)
            ->where('user_id','=',$user_id);
    }

    public function scopePublished($query){
    	$query->where('published_at','<=',Carbon::now())
    		->where('published','=',1);
    }

    public function scopeUnPublished($query){
        $user_id = session('id');
    	$query->where('published_at','>',Carbon::now())
    		->orWhere('published','=',0)
            ->where('user_id','=',$user_id);
    }

    public function getUnPublishedPosts(){
        return $this->latest('id')->unPublished()->paginate(5);
    }

    public function getPostInfo($id){
        $posts = $this->findOrFail($id);
        return $posts;
    }

}
