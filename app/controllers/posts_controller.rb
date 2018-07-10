class PostsController < ApplicationController
  def index
  end

  def show
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @membership = Membership.find_by(group_id: params[:group_id], teacher_id: current_teacher.id)
    @save_post = SavePost.new
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
    @membership = Membership.find_by(group_id: params[:group_id], teacher_id: current_teacher.id)
  end

  def create
    group = Group.find(params[:group_id])
    post = group.posts.build(post_params)
    post.group_id = group.id
    post.teacher_id = current_teacher.id

    if params[:images] != nil
      post.images.attach(params[:post][:images])
    end

    if post.save!
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
    post = Post.find(params[:id])
    post.images.attach(params[:post][:images])

    if post.update(post_params)
      flash[:notice] = 'post updated!'
      redirect_to "/groups/#{post.group_id}"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{post.group_id}/posts/#{post.id}/edit"
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

  def delete_image_attachment
    @post = Post.find(params[:post_id])
    @selected_image = @post.images[params[:index].to_i]

    if @selected_image.purge
      flash[:notice] = 'image removed'
      redirect_to "/groups/#{@post.group_id}/posts/#{@post.id}/edit"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{@post.group_id}/posts/#{@post.id}/edit"
    end
  end

  def post_params
    params.require(:post).permit(:group_id, :title, :description, :price, :images, :request)
  end
end
