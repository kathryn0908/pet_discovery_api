class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :dogs, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.integer :dog_id
      t.inetger :user_id

      t.timestamps
    end
  end
end
