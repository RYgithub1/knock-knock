class CreateAboutNations < ActiveRecord::Migration[5.2]

  def change
    create_table :about_nations do |t|
      t.references :about,  null: false, foreign_key: true
      t.references :nation, null: false, foreign_key: true
      t.timestamps
    end
  end

end
