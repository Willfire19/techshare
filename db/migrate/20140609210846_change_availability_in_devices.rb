class ChangeAvailabilityInDevices < ActiveRecord::Migration
  def change
  	change_column :devices, :availability, :string, :default => "Available"
  end
end
