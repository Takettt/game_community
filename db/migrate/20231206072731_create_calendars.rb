class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.integer :player_id
      t.integer :post_id
      t.integer :group_id
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :ending_time, null: false
      t.timestamps
    end
  end
end
