class GroupApproval < ApplicationRecord
  validates :group_password,presence: true
  validates :status,presence: true
end
