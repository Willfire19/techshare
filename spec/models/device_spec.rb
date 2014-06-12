require 'rails_helper'

RSpec.describe Device, :type => :model do
  
  it "has a valid factory" do
  	FactoryGirl.build(:device).should be_valid
  end

end
