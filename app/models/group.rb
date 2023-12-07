class Group < ApplicationRecord
  has_many :group_approvals, dependent: :destroy
  has_many :group_players, dependent: :destroy
  has_many :calendars, dependent: :destroy
  
  
  validates :name,presence: true
  validates :introduction,presence: true
  validates :owner_id,presence: true
end
