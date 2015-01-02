class AddLobbyToGame < ActiveRecord::Migration
  def change
    add_column :games, :lobby, :boolean, default: true
  end
end
