class CreatePictures < ActiveRecord::Migration[5.2]

  def change
    create_table :pictures do |t|
      t.references :about, null: false, foreign_key: true
      t.string     :image, null: false
      t.timestamps
    end

  end
end
