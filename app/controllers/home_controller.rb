class HomeController < ApplicationController

	def home
		@devices = Device.last(3)
	end

end
