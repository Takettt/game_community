class CreateEndPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :end_players do |t|

      t.timestamps
    end
  end
end
