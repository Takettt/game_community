class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum today_tension: { very_well: 0, fine: 1, usually: 2, tired: 3 }

  validates :game_name,presence: true
  validates :participate_number,presence: true
  validates :start_time,presence: true
  validates :ending_time,presence: true
  validates :today_tension,presence: true
  validates :content,presence: true
end
