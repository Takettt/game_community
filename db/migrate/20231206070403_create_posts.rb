class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :player_id, null: false
      t.string :game_name, null: false
      t.integer :participate_number, null: false
      t.datetime :start_time, null: false
      t.datetime :ending_time, null: false
      t.integer :today_tension, null: false, default: 0
      t.text :content, null: false
      t.timestamps
    end
  end
end
