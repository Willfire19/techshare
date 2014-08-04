class AddContactEmailToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :contact_email, :string

    Device.reset_column_information
    Device.find_each do |device|
    	device.contact_email = device.user.email
    	device.save
    end

  end
end
