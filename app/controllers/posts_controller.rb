class PostsController < ApplicationController
  def index
  end

  def show
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    group = Group.find(params[:group_id])
    post = group.posts.build(post_params)
    post.group_id = group.id
    post.teacher_id = current_teacher.id
    post.images.attach(params[:post][:images])

    if post.save
      flash[:notice] = 'post created!'
      redirect_to "/"
    else
      flash[:alert] = 'error. please try again'
      redirect_to "/"
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.images.attach(params[:post][:images])

    if @post.update(post_params)

      flash[:notice] = 'post updated!'
      redirect_to "/groups/#{@group.id}"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{@group.id}/posts/#{@post.id}/edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = 'post deleted!'
      redirect_to "/groups/#{post.group_id}"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{post.group_id}/posts/#{post.id}/edit"
    end
  end

  def post_params
    params.require(:post).permit(:group_id, :title, :description, :price, :images)
  end
end
