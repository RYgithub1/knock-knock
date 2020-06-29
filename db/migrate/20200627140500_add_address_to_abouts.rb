class AddAddressToAbouts < ActiveRecord::Migration[5.2]

  def change
    add_column :abouts, :address, :string
    add_column :abouts, :latitude, :float
    add_column :abouts, :longitude, :float
  end

end
