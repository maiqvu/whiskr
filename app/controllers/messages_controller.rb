class MessagesController < ApplicationController

  before_action :check_if_logged_in
  # before_action :nav_check

  ### TO DO: show /messages/:id for all messages between @current_user and user with params[:id]. create new message if there's no existing message thread between 2 users.

  # def show
  #   @messages = @conversation.messages
  #   @messages.where("user_id != ?", @current_user.id)
  #   @message = @conversation.messages.new
  # end


  # def create
  #   @message = @conversation.messages.create( message_params )
  #   @message.user = @current_user
  #   redirect_to conversation_messages_path( @conversation )
  # end


  # private
  # def message_params
  #     params.require(:message).permit(:body, :sender_id, :recipient_id)
  # end

end