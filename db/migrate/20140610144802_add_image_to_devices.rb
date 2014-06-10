class AddImageToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :image, :string
  end
end
