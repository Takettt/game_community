class Calendar < ApplicationRecord
   belongs_to :player
   belongs_to :group
   belongs_to :post
   
   validates :date,presence: true
   validates :start_time,presence: true
   validates :ending_time,presence: true
end
