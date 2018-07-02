class ReviewsController < ApplicationController
  def index

    if params[:q_group]
      @groups = Group.where('name LIKE ?', "%#{params[:q_group]}%")
    else
      @groups = Group.all
    end

    if params[:q_review]
      @reviews = Review.where('product LIKE ?', "%#{params[:q_review]}%")
    else
      @reviews = Review.all
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.teacher_id = current_teacher.id
    @review.pictures.attach(params[:review][:pictures])

    if @review.save!
      flash[:notice] = 'review created!'
      redirect_to "/reviews"
    else
      flash[:alert] = 'error. please try again'
      render "/reviews/new"
    end
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.pictures.attach(params[:review][:images])

    if review.update(review_params)
      flash[:notice] = 'review updated!'
      redirect_to "/reviews/#{review.id}"
    else
      flash[:alert] = 'error. please try again'
      render "/reviews/#{review.id}/edit"
    end
  end

  def destroy
    review = Review.find(params[:id])

    if review.destroy
      flash[:notice] = 'review destroyed'
      redirect_to reviews_path
    else
      flash[:alert] = 'error. please try again'
      render "/reviews/#{review.id}/edit"
    end
  end

  def review_params
    params.require(:review).permit(:product, :content, :pictures)
  end
end
