class LandingPageController < ApplicationController
  
  before_action :check_if_logged_in, only: [:dashboard]
  
  def home
  end

  def dashboard
  end

end