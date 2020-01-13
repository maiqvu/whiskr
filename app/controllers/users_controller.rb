class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:new]
  before_action :check_if_admin, only: [:index]

  def new
    @user = User.new
  end


  def create
    @user = User.create( user_params )

    if @user.persisted?   # Log them in automatically after successful sign-up.
      session[:user_id] = @user.id
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
    user.update( user_params )
    redirect_to user_path( user.id )
  end


  def destroy
    User.destroy( params[:id] )
    redirect_to users_path
  end

  # strong params
  private
  def user_params
    params.require( :user ).permit( :name, :email, :password, :password_confirmation, :bio )
  end

end
