<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Images;
use Carbon\Carbon;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Post $postModel, Images $imgModel)
    {
        //$posts = Post::all();
        //$posts = Post::latest('published_at')->get();
        //$user_id = session('id');

        //dd($tt);
        $posts = $postModel->getPublishedPosts();
        foreach ($posts as $key => $value) {
             $img = $imgModel->getLastPostImg($value['id']);
             $name = '';
             if(isset($img[0]))
                $name = $img[0]['name'];
             $posts[$key]['img'] = $name;
        }
        //dd($posts);
        $user_id = session('id');
        return view('post.index',['posts'=>$posts,'user_id'=>$user_id]);
    }

    public function unpublished(Post $postModel, Images $imgModel){
        $posts = $postModel->getUnPublishedPosts();
        foreach ($posts as $key => $value) {
             $img = $imgModel->getLastPostImg($value['id']);
             $name = '';
             if(isset($img[0]))
                $name = $img[0]['name'];
             $posts[$key]['img'] = $name;
        }
        //dd($posts);
        $user_id = session('id');
        return view('post.account',['posts'=>$posts,'user_id'=>$user_id]);
    }

    public function account(Post $postModel, Images $imgModel){
        $posts = $postModel->getPublishedMyPosts();
        foreach ($posts as $key => $value) {
             $img = $imgModel->getLastPostImg($value['id']);
             $name = '';
             if(isset($img[0]))
                $name = $img[0]['name'];
             $posts[$key]['img'] = $name;
        }
        //dd($posts);
        $user_id = session('id');
        return view('post.account',['posts'=>$posts,'user_id'=>$user_id]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('post.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Post $postModel, Request $request, Images $imgModel)
    {
        $data = $request->all();
        //dd($data['images']);

        $data['user_id'] = session('id');
        $post = $postModel->create($data);
        $lastInsertedId= $post->id;
        if(isset($data['images'][0])){
            foreach($data['images'] as $file) {
                $size = $file->getSize();
                //print_r($size);
                if($size<=1500000){
                    $destinationPath = public_path() .'/images/';
                    $oldaname = $file->getClientOriginalName();
                    $ex = $file->getClientOriginalExtension();
                    $filename = md5(time().$oldaname).'.'.$ex;
                    //echo $destinationPath.' '.$filename.' = '.$size.' // ';
                    $file->move($destinationPath, $filename);
                    $imgModel->create([
                            'user_id'=>session('id'),
                            'post_id'=>$lastInsertedId,
                            'name'=>$filename
                        ]);
                }

            }
        }
        return redirect()->route('post.show',['id'=>$lastInsertedId]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Post $postModel,$id,Images $imgModel)
    {
        //print_r($id);
        $post = $postModel->getPostInfo($id);
        $imgs = $imgModel->getAllPostImg($post['id']);
        $user_id = session('id');
        return view('post.show',['post'=>$post,'imgs'=>$imgs,'user_id'=>$user_id]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $postModel,$id,Images $imgModel)
    {
        $post = $postModel->getPostInfo($id);
        $imgs = $imgModel->getAllPostImg($post['id']);
        $user_id = session('id');
        return view('post.edit',['post'=>$post,'imgs'=>$imgs,'user_id'=>$user_id]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id,Post $postModel, Images $imgModel)
    {

        $post = $postModel->getPostInfo($id);
        $data = $request->all();
        $post->fill($data);
        $post->save();

        $lastInsertedId= $id;
        if(isset($data['images'][0])){
            foreach($data['images'] as $file) {
                $size = $file->getSize();
                //print_r($size);
                if($size<=1500000){
                    $destinationPath = public_path() .'/images/';
                    $oldaname = $file->getClientOriginalName();
                    $ex = $file->getClientOriginalExtension();
                    $filename = md5(time().$oldaname).'.'.$ex;
                    //echo $destinationPath.' '.$filename.' = '.$size.' // ';
                    $file->move($destinationPath, $filename);
                    $imgModel->create([
                            'user_id'=>session('id'),
                            'post_id'=>$lastInsertedId,
                            'name'=>$filename
                        ]);
                }

            }
        }

        return redirect()->route('post.show',['id'=>$lastInsertedId]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $postModel,$id)
    {
        $post = $postModel->getPostInfo($id);
        $post->delete();
        return redirect()->route('posts');
    }
}
