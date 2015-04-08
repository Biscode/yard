class AddImageToUser < ActiveRecord::Base
attr_accessible :users_id, :image, :remote_image_url
	belongs_to :users
	mount_uploader :image, ImageUploader
end
