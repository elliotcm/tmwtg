class JoinGamesToPlayers < ActiveRecord::Migration
  def change
    create_table :games_players do |t|
      t.references :game
      t.references :player
      t.timestamps
    end
  end
end
