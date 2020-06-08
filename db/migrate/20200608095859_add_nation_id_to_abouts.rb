class AddNationIdToAbouts < ActiveRecord::Migration[5.2]

  def change
    add_column :abouts, :nation_id, :integer
  end

end
