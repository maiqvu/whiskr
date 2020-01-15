class ConversationsController < ApplicationController

  before_action :check_if_logged_in
  before_action :nav_check

  def index
    @conversations = Conversation.between( @current_user.id, @current_user.id )
    @users = User.where.not( id: @current_user.id )
  end


  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between( params[:sender_id], params[:receiver_id] ).first
    else
      @conversation = Conversation.create( convo_params )
    end
    redirect_to conversation_messages_path( @conversation.id )
  end

  private
  def convo_params
    params.permit(:sender_id, :receiver_id)
  end

end