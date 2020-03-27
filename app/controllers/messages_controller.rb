class MessagesController < ApplicationController

  before_action :check_if_logged_in  
  
  def new
  end
  
  def create
    @other_user = User.find( params[:user_id] )
    @message = Messages.create( message_params )
    @current_user.all_messages_with( @other_user ) << @message
    redirect_to messages_with_path( params[:user_id] )
  end
  
  def index
    @other_user = User.find( params[:user_id] )
    @messages = @current_user.all_messages_with( @other_user )
  end

  private
  def message_params
    params.require(:message).permit(:body, :sender_id, :recipient_id)
  end

end