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

  it "renders three devices" do
    render
    # assert_select "div.devices", :text => "Nexus 4".to_s, :count => 3
    # assert_select "div div", :count => 3
    assert_template :partial => '_device', :count => 3
  end
end
