class Tutor < ApplicationRecord
	mount_uploader :image1, ImageUploader
	
	belongs_to :user 
	has_many :lectures, dependent: :destroy
end
