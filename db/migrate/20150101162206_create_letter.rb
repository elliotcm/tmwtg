class CreateLetter < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.references :game
      t.references :player
      t.integer :row_index
      t.integer :column_index
      t.string :character
      t.boolean :blank, default: false
      t.timestamps
    end
  end
end
