class Square
  def initialize(game_id)
    @game_id = game_id
  end

  def premium?
    false
  end

  def letter(row_index, column_index)
    Letter.where(game_id: @game_id, row_index: row_index, column_index: column_index).last
  end
end
