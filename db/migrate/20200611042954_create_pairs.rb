class CreatePairs < ActiveRecord::Migration[5.2]

  def change
    create_table :pairs do |t|
      t.string :name, null: false
      t.index :name,  unique: true
      t.timestamps
    end
  end

end
