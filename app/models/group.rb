class Group < ApplicationRecord
  validates :name,presence: true
  validates :introduction,presence: true
  validates :owner_id,presence: true
end
