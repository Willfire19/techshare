class AddAvailabilityToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :availability, :boolean
  end
end
