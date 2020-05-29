class Favorite < ApplicationRecord
  belongs_to :dogs
  belongs_to :users
end
