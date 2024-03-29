class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :player

  enum today_tension: { very_well: 0, fine: 1, usually: 2, tired: 3 }
  enum game_genre: { fps: 0, rpg: 1, horror_game: 2, action_game: 3}

  validates :game_name,presence: true
  validates :participate_number,presence: true
  validates :start_time,presence: true
  validates :ending_time,presence: true
  validates :today_tension,presence: true
  validates :content,presence: true
  validates :game_genre,presence: true

  def self.postlooks(search, word)
    if search == "perfect_match"
      @post = Post.includes(:player).where("game_name LIKE? OR participate_number LIKE? OR start_time LIKE? OR ending_time LIKE?OR today_tension LIKE?","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%").or(Post.includes(:player).where({players: {nickname: word}}))
    elsif search == "forward_match"
      @post = Post.joins(:player).where("game_name LIKE? OR participate_number LIKE? OR start_time LIKE? OR ending_time LIKE? OR today_tension LIKE?","#{word}%", "#{word}%","#{word}%","#{word}%","#{word}%").or(Post.joins(:player).where("players.nickname LIKE ?", "%#{word}%"))
    elsif search == "backward_match"
      @post = Post.joins(:player).where("game_name LIKE? OR participate_number LIKE? OR start_time LIKE? OR ending_time LIKE? OR today_tension LIKE?","%#{word}", "%#{word}","%#{word}","%#{word}","%#{word}").or(Post.joins(:player).where("players.nickname LIKE ?", "%#{word}%"))
    elsif search == "partial_match"
      @post = Post.joins(:player).where("game_name LIKE ? OR participate_number LIKE ? OR start_time LIKE ? OR ending_time LIKE ? OR today_tension LIKE ?", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%").or(Post.joins(:player).where("players.nickname LIKE ?", "%#{word}%"))
    else
      @post = Post.all
    end
  end

  def self.postlooks_tag(search_tag, word_tag)
    if search_tag == "perfect_match"
      @post = Post.where("game_genre LIKE?" ,"%#{word}%")
    else
      @post = Post.all
    end
  end

  def favorited_by?(player)
    favorites.exists?(player_id: player.id)
  end
end