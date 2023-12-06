class CreateGroupApprovals < ActiveRecord::Migration[6.1]
  def change
    create_table :group_approvals do |t|
      t.integer :player_id
      t.integer :group_id
      t.string :group_password, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
    
  end
end
