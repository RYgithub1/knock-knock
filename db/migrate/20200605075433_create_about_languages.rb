class CreateAboutLanguages < ActiveRecord::Migration[5.2]

  def change
    create_table :about_languages do |t|
      t.references :about,    null:false, foreign_key: true
      t.references :language, null:false, foreign_key: true
      t.timestamps
    end
  end

end
