require 'rails_helper'

RSpec.describe "home/home", :type => :view do

  let(:user){ FactoryGirl.create(:user) }

  before(:each) do
    assign(:devices, [
      Device.create!(
        :name => "Nexus 4",
        :availability => "Available",
        # :user_id => 1
        :user => user
      ),
      Device.create!(
        :name => "Nexus 4",
        :availability => "Available",
        # :user_id => 1
        :user => user
      ),
      Device.create!(
        :name => "Nexus 4",
        :availability => "Available",
        # :user_id => 1
        :user => user
      )
    ])
  end

  
end
