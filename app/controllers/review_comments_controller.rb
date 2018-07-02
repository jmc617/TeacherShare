class ReviewCommentsController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    review_comment = review.review_comments.build(review_comment_params)
    review_comment.review_id = review.id
    review_comment.teacher_id = current_teacher.id

    if review_comment.save!
      flash[:notice] = 'comment added!'
      redirect_to "/reviews/#{review.id}"
    else
      flash[:alert] = 'error. please try again'
      redirect_to "/reviews/#{review.id}"
    end
  end

  def show
  end

  def edit
    @review = Review.find(params[:review_id])
    @review_comment = ReviewComment.find(params[:id])
  end

  def update
    @review = Review.find(params[:review_id])
    @review_comment = ReviewComment.find(params[:id])

    if @review_comment.update(review_comment_params)

      flash[:notice] = 'comment updated!'
      redirect_to "/reviews/#{@review.id}"
    else
      flash[:alert] = 'error. please try again'
      render "/reviews/#{@review.id}/review_comments/#{@review_comment.id}/edit"
    end
  end

  def destroy
    review_comment = ReviewComment.find(params[:id])
    if review_comment.destroy
      flash[:notice] = 'comment deleted!'
      redirect_to "/reviews/#{review_comment.review_id}"
    else
      flash[:alert] = 'error. please try again'
      render "/reviews/#{review_comment.review_id}/review_comments/#{review_comment.id}/edit"
    end
  end

  def review_comment_params
    params.require(:review_comment).permit(:content)
  end
end
