class ConversationsController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_teacher.id, current_teacher.id)
    @teachers = Teacher.where.not(id: current_teacher.id)
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end
