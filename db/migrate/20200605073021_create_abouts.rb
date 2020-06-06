class CreateAbouts < ActiveRecord::Migration[5.2]

  def change
    create_table :abouts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :sex, null: false
      t.text :body
      t.string :invitation
      t.string :recommendation
      t.timestamps
    end
  end

end