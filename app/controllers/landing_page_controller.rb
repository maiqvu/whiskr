class LandingPageController < ApplicationController
  
  before_action :check_if_logged_in, only: [:dashboard]
  before_action :nav_check, only: [:home]
  
  def home
  end

  def dashboard
    @current_user.matches_with?()
  end

end