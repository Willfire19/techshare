FactoryGirl.define  do
	
	factory :user do
		sequence(:email) 	{ |n| "person_#{n}@example.com" }
		# email 'test1@example.com'
		password			"password"
		password_confirmation "password"

		factory :admin do
			admin true
		end
	end

	factory :device do
		name "Nexus 5"
		availability "Available"
		user
		contact_email "test@example.com"
	end

end