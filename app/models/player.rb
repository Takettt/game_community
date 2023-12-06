class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :last_name,presence: true
         validates :first_name,presence: true
         validates :nickname,presence: true
         validates :platform,presence: true
         validates :addicted_game,presence: true
         validates :play_style,presence: true
         validates :is_active,presence: true
end
