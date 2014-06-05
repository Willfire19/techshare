require 'rails_helper'

RSpec.describe "devices/show", :type => :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :name => "Nexus 4"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
