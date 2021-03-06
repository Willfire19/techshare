def sign_in_user(user, options={})
	if options[:no_capybara]
		# Sign in when not using Capybara as well.
		remember_token = User.new_remember_token
		cookies[:remember_token] = user.remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
	else
		visit signin_path
		fill_in "Email",		with: user.email 
		fill_in "Password",		with: user.password 
		click_button "Sign in"
	end	
end