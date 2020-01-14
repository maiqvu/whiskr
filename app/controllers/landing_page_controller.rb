class LandingPageController < ApplicationController
  
  before_action :check_if_logged_in, only: [:dashboard]
  
  def home
  end

  def dashboard
    @current_user.matches_with?()
  end

end