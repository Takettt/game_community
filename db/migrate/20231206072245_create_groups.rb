class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :group_approval, null: false, default: 0
      t.integer :owner_id, null: false
      t.timestamps
    end
  end
end
