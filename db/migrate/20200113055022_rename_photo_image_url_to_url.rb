class RenamePhotoImageUrlToUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :image_url, :url
  end
end