class AddOnBoardToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :on_board, :boolean, default: false
  end
end
