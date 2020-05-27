class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column(:dogs, :image, :text)
  end
end
