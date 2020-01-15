class MessagesController < ApplicationController

  before_action :check_if_logged_in
  before_action :nav_check
  before_action do
    @conversation = Conversation.find( params[:conversation_id] )
  end


  def index
    @messages = @conversation.messages
    @messages.where("user_id != ?", @current_user.id)
    @message = @conversation.messages.new
  end


  def create
    @message = @conversation.messages.create( message_params )
    @message.user = @current_user
    redirect_to conversation_messages_path( @conversation )
  end


  private
  def message_params
      params.require(:message).permit(:body, :user_id)
  end

end