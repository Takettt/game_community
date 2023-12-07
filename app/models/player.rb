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

         validates :last_name,presence: true
         validates :first_name,presence: true
         validates :nickname,presence: true
         validates :platform,presence: true
         validates :addicted_game,presence: true
         validates :play_style,presence: true
         validates :is_active,presence: true
         
         def active_for_authentication?
           super && (is_active == true)
         end
end
