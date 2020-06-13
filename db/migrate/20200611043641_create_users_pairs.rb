class CreateUsersPairs < ActiveRecord::Migration[5.2]

  def change
    create_table :users_pairs do |t|
      t.references :user, foreign_key: true
      t.references :pair, foreign_key: true
      t.timestamps
    end
  end

end
