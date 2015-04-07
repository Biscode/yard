class AddImageToUser < ActiveRecord::Migration
  def change
    attr_accessible :users_id, :image, :remote_image_url
	belongs_to :users
	mount_uploader :image, ImageUploader
  end
end
