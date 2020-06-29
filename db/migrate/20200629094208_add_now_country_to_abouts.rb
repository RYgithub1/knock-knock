class AddNowCountryToAbouts < ActiveRecord::Migration[5.2]

  def change
    add_column :abouts, :nowCountry, :string
    add_column :abouts, :nowCity, :string
  end

end
