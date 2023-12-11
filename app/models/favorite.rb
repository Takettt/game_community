class Favorite < ApplicationRecord
  belongs_to :player
  belongs_to :post
  
  validates :playerr_id, uniqueness: {scope: :post_id}
end
