class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :player

  enum today_tension: { very_well: 0, fine: 1, usually: 2, tired: 3 }

  validates :game_name,presence: true
  validates :participate_number,presence: true
  validates :start_time,presence: true
  validates :ending_time,presence: true
  validates :today_tension,presence: true
  validates :content,presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("game_name LIKE? OR participate_number LIKE? OR start_time LIKE? OR ending_time LIKE?OR today_tension LIKE?","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%")
    elsif search == "forward_match"
      @post = Post.where("game_name LIKE? OR participate_number LIKE? OR start_time LIKE? OR ending_time LIKE?OR today_tension LIKE?","%#{word}%", "%#{word}%","%#{word}%","%#{word}%","%#{word}%")
    elsif search == "backward_match"
      @post = Post.where("game_name LIKE? OR participate_number LIKE? OR start_time LIKE? OR ending_time LIKE?ORtoday_tension LIKE?","%#{word}%", "%#{word}%","%#{word}%","%#{word}%","%#{word}%")
    elsif search == "partial_match"
      @post = Post.where("game_name LIKE? OR participate_number LIKE? OR start_time LIKE? OR ending_time LIKE?OR today_tension LIKE?","%#{word}%", "%#{word}%","%#{word}%","%#{word}%","%#{word}%")
    else
      @post = Post.all
    end
  end

  def favorited_by?(player)
    favorites.exists?(player_id: player.id)
  end
end
