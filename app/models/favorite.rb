class Favorite < ApplicationRecord
  belongs_to :player
  belongs_to :post
  
  validates :player_id, uniqueness: {scope: :post_id}
end
