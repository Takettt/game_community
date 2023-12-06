class Calendar < ApplicationRecord
   validates :date,presence: true
   validates :start_time,presence: true
   validates :ending_time,presence: true
end
