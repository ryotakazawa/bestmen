class AddAddressToPics < ActiveRecord::Migration[5.1]
  def change
     add_column :pics, :address, :string
  end
end
