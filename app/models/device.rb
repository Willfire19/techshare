class Device < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :user

	validates :name, presence: true,
									 length: { minimum: 5 }
	validates :availability, presence: true
	validates :user_id, presence: true
	# validates :image, presence: true
end
