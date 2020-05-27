class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :life_span
      t.string :name
      t.string :temperment
      t.string :weight
      
    

      t.timestamps
    end
  end
end
