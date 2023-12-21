class Group < ApplicationRecord
  enum group_approval: { applying: 0, approval: 1, rejected: 2}
  
  has_many :group_approvals, dependent: :destroy
  has_many :group_players, dependent: :destroy
  has_many :players, through: :group_players
  has_many :calendars, dependent: :destroy
  has_one_attached :group_image
  
  
  validates :name,presence: true
  validates :introduction,presence: true
  validates :owner_id,presence: true
  
  def is_owned_by?(player)
    owner_id == player.id
  end
end
