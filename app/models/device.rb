class Device < ActiveRecord::Base

	validates :name, presence: true,
									 length: { minimum: 5 }
	validates :availability, presence: true
end
