class Comment < ApplicationRecord
   belongs_to :player
   belongs_to :post
   validates :thought,presence: true
end
