class SavePostsController < ApplicationController
before_action :authenticate_teacher!

  def index
    @save_posts = current_teacher.save_posts
  end

  def create
    post = Post.find(params[:post_id])
    save_post = post.save_posts.build
    save_post.post_id = post.id
    save_post.teacher_id = current_teacher.id

    if save_post.save!
      flash[:notice] = 'post saved!'
      redirect_to "/groups/#{post.group_id}/"
    else
      flash[:alert] = 'error. please try again'
      redirect_to "/groups/#{post.group_id}/"
    end
  end

  def edit
  end

  def destroy
    save_post = SavePost.find(params[:id])
    if save_post.destroy
      flash[:notice] = 'post deleted'
      redirect_to save_posts_path
    else
      flash[:alert] = 'error. please try again'
      redirect save_posts_path
    end
  end

  def save_params
    params.require(:save_post).permit(:post_id)
  end
end
