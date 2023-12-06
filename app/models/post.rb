class Post < ApplicationRecord
  
  validates :game_name,presence: true
  validates :participate_number,presence: true
  validates :start_time,presence: true
  validates :ending_time,presence: true
  validates :today_tension,presence: true
  validates :content,presence: true
end
