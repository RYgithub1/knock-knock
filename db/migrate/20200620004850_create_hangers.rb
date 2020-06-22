class CreateHangers < ActiveRecord::Migration[5.2]

  def change
    create_table :hangers do |t|
      t.integer :user_id
      t.integer :about_id
      t.timestamps
    end
  end

end
