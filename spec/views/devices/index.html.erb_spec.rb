require 'rails_helper'

RSpec.describe "devices/index", :type => :view do

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
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => "Nexus 4".to_s, :count => 2
    assert_select "tr>td", :text => "Available".to_s, :count => 2
  end
end
