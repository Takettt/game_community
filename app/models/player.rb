class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum play_style: { enjoy: 0, kill_move: 1, rank_priority: 2, hide: 3 }

         has_many :favorites, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :group_players, dependent: :destroy
         has_many :group_approvals, dependent: :destroy
         has_many :calendars, dependent: :destroy
         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         has_many :followings, through: :active_relationships, source: :followed
         has_many :followers, through: :passive_relationships, source: :follower

         validates :last_name,presence: true
         validates :first_name,presence: true
         validates :nickname,presence: true
         validates :platform,presence: true
         validates :addicted_game,presence: true
         validates :play_style,presence: true
         validates :is_active,presence: true
         
          # 指定したユーザーをフォローする
  def follow(player)
    active_relationships.create(followed_id: player.id)
  end
  
  # 指定したユーザーのフォローを解除する
  def unfollow(player)
    active_relationships.find_by(followed_id: player.id).destroy
  end
  
  # 指定したユーザーをフォローしているかどうかを判定
  def following?(player)
    followings.include?(player)
  end
end