class GroupApproval < ApplicationRecord
  belongs_to :player
  belongs_to :group
  
  enum group_approval: { applying: 0, approval: 1, rejected:  }
  
  validates :group_password,presence: true
  validates :status,presence: true
end
