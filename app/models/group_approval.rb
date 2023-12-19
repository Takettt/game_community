class GroupApproval < ApplicationRecord
  enum status: { applying: 0, approval: 1, rejected: 2}
  
  belongs_to :player
  belongs_to :group
  
  validates :group_password,presence: true
  validates :status,presence: true
end
