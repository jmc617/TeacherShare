class TeachersController < ApplicationController
  def index
  end

  def show
    @teacher = Teacher.find(params[:id])
    @posts = Post.where(teacher_id: params[:id])
    @reviews = Review.where(teacher_id: params[:id])
  end

end
