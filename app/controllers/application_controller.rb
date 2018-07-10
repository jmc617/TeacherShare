class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox ||= current_teacher.mailbox
  end

  def conversation
    @conversation ||= current_teacher.mailbox.inbox
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :location, :aboutMe, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :location, :aboutMe, :avatar])
  end
end
