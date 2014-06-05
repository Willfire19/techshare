require 'rails_helper'

RSpec.describe "devices/index", :type => :view do
  before(:each) do
    assign(:devices, [
      Device.create!(
        :name => "Nexus 4"
      ),
      Device.create!(
        :name => "Nexus 4"
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => "Nexus 4".to_s, :count => 2
  end
end
