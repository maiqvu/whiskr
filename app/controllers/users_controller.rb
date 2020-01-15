class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:new, :create]
  before_action :check_if_admin, only: [:index]
  before_action :nav_check

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
    @user = User.find( params[:id] )
  end

  def update
    user = User.find( params[:id] )
    user.update( edit_user_params )
    redirect_to user_path( user.id )
  end

  def destroy
    User.destroy( params[:id] )
    redirect_to root_path
  end

  def profile
    
  end
  
  # strong params
  private
  def new_user_params
    params.require( :user ).permit( :email, :password, :password_confirmation )
  end

  private
  def edit_user_params
    params.require( :user ).permit( :name, :email, :bio, :password, :password_confirmation )
  end

end