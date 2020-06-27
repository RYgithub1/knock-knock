class AddAddressToAbouts < ActiveRecord::Migration[5.2]

  def change
    add_column :abouts, :address, :string
    add_column :abouts, :latitude, :decimal, precision: 9, scale: 6
    add_column :abouts, :longitude, :decimal, precision: 10, scale: 6
  end

end
