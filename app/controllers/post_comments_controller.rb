class PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post_comment = post.post_comments.build(post_comment_params)
    post_comment.post_id = post.id
    post_comment.teacher_id = current_teacher.id

    if post_comment.save!
      flash[:notice] = 'comment added!'
      redirect_to "/groups/#{post.group_id}/posts/#{post.id}"
    else
      flash[:alert] = 'error. please try again'
      redirect_to "/groups/#{post.group_id}/posts/#{post.id}"
    end
  end

  def show
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @group = Group.find(params[:group_id])
    @post_comment = PostComment.find(params[:id])

    if @post_comment.update(post_comment_params)

      flash[:notice] = 'comment updated!'
      redirect_to "/groups/#{@group.id}/posts/#{@post.id}"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{@group.id}/posts/#{@post.id}/post_comments/#{@post_comment.id}/edit"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @group = Group.find(params[:group_id])
    @post_comment = PostComment.find(params[:id])
    if @post_comment.destroy
      flash[:notice] = 'comment deleted!'
      redirect_to "/groups/#{@group.id}/posts/#{@post.id}"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{@group.id}/posts/#{@post.id}/post_comments/#{@post_comment.id}/edit"
    end
  end

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
