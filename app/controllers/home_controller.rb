class HomeController < ApplicationController
	before_filter :authenticate_user!, :only => [:profile]
	
	def home
		@devices = Device.last(2)
	end

	def profile
		@user = current_user
	end

end
