class HomeController < ApplicationController
	before_filter :authenticate_user!, :only => []
	
	def home
		@devices = Device.last(2)
	end

end
