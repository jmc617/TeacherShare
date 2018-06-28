class GroupsController < ApplicationController
  def index
    if params[:q]
      @groups = Group.where('name LIKE ?', "%#{params[:q]}%")
    else
      @groups = Group.all
    end
  end

  def show
    @group = Group.find(params[:id])
    @membership = Membership.new
    @membership_cancel = Membership.find_by group_id: params[:id], teacher_id: current_teacher.id
    if params[:q_posts]
      @posts = Post.where('title LIKE ?', "%#{params[:q_posts]}%")
    else
      @posts = @group.posts
    end

    if params[:q_members]
      @teachers = Teacher.where('username LIKE ?', "%#{params[:q_members]}%")
    else
      @teachers = @group.teachers
    end
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.teacher_id = current_teacher.id
    if group.save
      flash[:notice] = 'group created!'
      redirect_to "/groups"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/new"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = 'group updated!'
      redirect_to "/groups/#{@group.id}"
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{@group.id}/edit"
    end
  end

  def destroy
    group = Group.find(params[:id])
    if group.destroy
      flash[:notice] = 'group destroyed'
      redirect_to groups_path
    else
      flash[:alert] = 'error. please try again'
      render "/groups/#{@group.id}/edit"
    end
  end

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
