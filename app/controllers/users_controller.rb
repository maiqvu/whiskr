class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:new, :create]
  before_action :check_if_admin, only: [:index]
  # before_action :nav_check

  def new
    @user = User.new
  end

  def create
    @user = User.create( new_user_params )

    if @user.persisted?   # Log them in automatically after successful sign-up.
      session[:user_id] = @user.id
      flash[:notice] = 'You have successfully created an account.'
      redirect_to user_path( @user.id )
    else   # If error during sign-up, show the form again.
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
    # @current_user = User.find( params[:id] )
  end

  def update
    @current_user = User.find( params[:id] )
    @current_user.update!( edit_user_params )
    redirect_to user_path( @current_user.id )
  end

  def destroy
    User.destroy( params[:id] )
    redirect_to root_path
  end

  def create_match
    other_user = User.find( params[:id] )

    Match.create( liker_id: @current_user.id, liked_id: other_user.id )

    if Match.where( liker: other_user, liked: @current_user ).any?
      # Mutual match found!
      # Create a new message, and redirect to the messages page
      Message.create(
        body: '',
        sender_id: @current_user.id,
        recipient_id: other_user.id
      )
      redirect_to messages_with_path( other_user.id )
    else
      # No mutual match yet
      redirect_to dashboard_path
    end
  end
  
  
  # strong params
  private
  def new_user_params
    params.require( :user ).permit( :email, :password, :password_confirmation )
  end

  private
  def edit_user_params
    params.require( :user ).permit( :name, :email, :bio, :address, :password, :password_confirmation )
  end

end