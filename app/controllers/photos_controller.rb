class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    # raise 'hell'
    # @current_user.photos.create( url: params[:photo][:url] )
    @photo = Photo.create url: params[:photo][:url], user_id: @current_user.id 


    redirect_to photos_path
  end

  def index
    @photos = Photo.all
  end

  def destroy
    Photo.destroy( params[:id] )
    redirect_to photos_path
  end

end