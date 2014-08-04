require 'rails_helper'

RSpec.describe "devices/edit", :type => :view do
  
  let(:user){ FactoryGirl.create(:user) }

  before(:each) do
    @device = assign(:device, Device.create!(
      :name => "MyString",
      :availability => true,
      # :user_id => 1
      :user => user,
      :contact_email => user.email
    ))
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", device_path(@device), "post" do

      assert_select "input#device_name[name=?]", "device[name]"
      assert_select "select#device_availability[name=?]", "device[availability]"
    end
  end
end
