class HomeController < ApplicationController

	def home
		@devices = Device.last(2)
	end

end
