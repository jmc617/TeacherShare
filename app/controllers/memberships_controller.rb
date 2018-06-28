class MembershipsController < ApplicationController
  def index
  end

  def create
    group = Group.find(params[:group_id])
    membership = group.memberships.build
    membership.group_id = group.id
    membership.teacher_id = current_teacher.id

    if membership.save!
      flash[:notice] = 'group joined!'
      redirect_to "/groups"
    else
      flash[:alert] = 'error. please try again'
      redirect_to "/groups/#{group.id}"
    end
  end

  def edit
  end

  def destroy
    membership = Membership.find(params[:id])
    if membership.destroy
      flash[:notice] = 'membership deleted'
      redirect_to "/groups"
    else
      flash[:alert] = 'error. please try again'
      redirect "/groups/#{params[:id]}"
    end
  end

  def show
  end

  def membership_params
    params.require(:membership).permit(:group_id)
  end
end
