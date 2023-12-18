class GroupApproval < ApplicationRecord
  belongs_to :player
  belongs_to :group
  
  validates :group_password,presence: true
  validates :status,presence: true
end
