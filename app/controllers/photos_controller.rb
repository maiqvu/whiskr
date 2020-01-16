class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end


  def create
    photo = Photo.new

    if params[:file].present?
      req = Cloudinary::Uploader.upload( params[:file] )
      photo.url = req["public_id"]
      photo.user_id = @current_user.id
      photo.save
    end

    redirect_to user_path( @current_user.id )
  end


  def index
    @photos = Photo.all
  end


  def destroy
    Photo.destroy( params[:id] )
    redirect_to user_path( @current_user.id )
  end

end