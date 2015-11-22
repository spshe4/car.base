<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Images extends Model
{
    protected $fillable = ['user_id','post_id', 'name'];
    protected $quarded = ['id','created_at','updated_at'];


    public function getLastPostImg($post_id){
    	$imgs = $this->latest('id')->where('post_id',$post_id)->take(1)->get();
        return $imgs;
    }

    public function getAllPostImg($post_id){
    	$imgs = $this->latest('id')->where('post_id',$post_id)->get();

        return $imgs;
    }


}
