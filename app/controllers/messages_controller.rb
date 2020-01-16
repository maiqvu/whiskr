class MessagesController < ApplicationController

  before_action :check_if_logged_in
  # before_action :nav_check

  ### TO DO: show /messages/:id for all messages between @current_user and user with params[:id]. create new message if there's no existing message thread between 2 users.

  def index
    other_user = User.find(params[:user_id])
    @messages = @current_user.all_messages_with( other_user )
  end


  def new
  end


  def create
    @message = Messages.create( message_params )
  end


  private
  def message_params
      params.require(:message).permit(:body, :sender_id, :recipient_id)
  end

end