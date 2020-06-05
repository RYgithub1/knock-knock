class CreateAbouts < ActiveRecord::Migration[5.2]

  def change
    create_table :abouts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :sex
      t.text :body, null: false
      t.string :invitation
      t.timestamps
    end
  end

end