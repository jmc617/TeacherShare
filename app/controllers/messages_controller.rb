class MessagesController < ApplicationController
  before_action :authenticate_teacher!

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages

    @messages.where("teacher_id != ? AND read = ?", current_teacher.id, false).update_all(read: true)

    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.teacher = current_teacher

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :teacher_id)
    end
end
