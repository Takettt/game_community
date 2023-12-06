class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :player_id
      t.text :thought, null: false
      t.timestamps
    end
  end
end
