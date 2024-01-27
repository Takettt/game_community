class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum play_style: { enjoy: 0, kill_move: 1, rank_priority: 2, hide: 3 }
         enum search: { player: 0, post: 1}
         enum search_select: { perfect_match: 0, forward_match: 1, backward_match: 2, partial_match: 3}

        has_many :favorites, dependent: :destroy
        has_many :favorite_posts, through: :favorites, source: :post
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :group_players, dependent: :destroy
         has_many :groups, through: :group_players
         has_many :group_approvals, dependent: :destroy
         has_many :calendars, dependent: :destroy
         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         has_many :followings, through: :active_relationships, source: :followed
         has_many :followers, through: :passive_relationships, source: :follower
         has_one_attached :profile_image, dependent: :destroy

         validates :last_name,presence: true
         validates :first_name,presence: true
         validates :nickname,presence: true
         validates :platform,presence: true
         validates :addicted_game,presence: true
         validates :play_style,presence: true
         validates :is_active, inclusion: {in: [true, false]}

         def self.playerlooks(search, word)
           if search == "perfect_match"
             @player = Player.where("nickname LIKE? OR platform LIKE? OR addicted_game LIKE? OR play_style LIKE?","#{word}", "#{word}","#{word}%","#{word}%")
           elsif search == "forward_match"
             @player = Player.where("nickname LIKE? OR platform LIKE? OR addicted_game LIKE? OR play_style LIKE?","#{word}%", "#{word}","#{word}%","#{word}%")
           elsif search == "backward_match"
             @player = Player.where("nickname LIKE? OR platform LIKE? OR addicted_game LIKE? OR play_style LIKE?","%#{word}", "#{word}","#{word}%","#{word}%")
           elsif search == "partial_match"
             @player = Player.where("nickname LIKE? OR platform LIKE? OR addicted_game LIKE? OR play_style LIKE?","%#{word}%", "#{word}","#{word}%","#{word}%")
           else
             @player = Player.all
           end
         end


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
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

  def self.guest
    find_or_create_by!(email: 'g@g') do |player|
      player.last_name = 'ゲスト'
      player.first_name = 'ログイン'
      player.nickname = 'ゲスログ'
      player.platform = 'ps4'
      player.addicted_game = 'ゲーム'
      player.password = 'gggggg'
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end