require 'rails_helper'

RSpec.describe "devices/new", :type => :view do
  before(:each) do
    assign(:device, Device.new(
      :name => "MyString",
      :availability => true
    ))
  end

  it "renders new device form" do
    render

    assert_select "form[action=?][method=?]", devices_path, "post" do

      assert_select "input#device_name[name=?]", "device[name]"
      assert_select "select#device_availability[name=?]", "device[availability]"
    end
  end
end
