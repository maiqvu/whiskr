class LandingPageController < ApplicationController
  
  before_action :check_if_logged_in, only: [:dashboard]
  # before_action :nav_check, only: [:home]
  
  def home
  end

  def dashboard
    # Returns an array of all users except the currently logged in user.
    @users = User.where.not( id: @current_user.id )

    ### TO DO: @current_user.matches_with?( user_id of photo that was clicked on )
    # if true, render the message page
  end

  def map
    @users = User.select( :name, :latitude, :longitude )
    @maps_api_key = Rails.application.secrets.maps_api_key
    
  end

end