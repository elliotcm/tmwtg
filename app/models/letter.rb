class Letter < ActiveRecord::Base
  def self.create_starting_set(game_id)
    STARTING_SET.each_char do |character|
      Letter.create!(game_id: game_id, character: character)
    end

    STARTING_BLANKS.times do
      Letter.create!(game_id: game_id, blank: true)
    end
  end

  def value
    return 0 if blank?

    VALUES[character]
  end

  STARTING_BLANKS = 2

  STARTING_SET = [
    'E' * 12,
    'A' * 9,
    'I' * 9,
    'O' * 8,
    'N' * 6,
    'R' * 6,
    'T' * 6,
    'L' * 4,
    'S' * 4,
    'U' * 4,
    'D' * 4,
    'G' * 3,
    'B' * 2,
    'C' * 2,
    'M' * 2,
    'P' * 2,
    'F' * 2,
    'H' * 2,
    'V' * 2,
    'W' * 2,
    'Y' * 2,
    'K' * 1,
    'J' * 1,
    'X' * 1,
    'Q' * 1,
    'Z' * 1,
  ].join.freeze

  VALUES = {
    'E' => 1,
    'A' => 1,
    'I' => 1,
    'O' => 1,
    'N' => 1,
    'R' => 1,
    'T' => 1,
    'L' => 1,
    'S' => 1,
    'U' => 1,
    'D' => 2,
    'G' => 2,
    'B' => 3,
    'C' => 3,
    'M' => 3,
    'P' => 3,
    'F' => 4,
    'H' => 4,
    'V' => 4,
    'W' => 4,
    'Y' => 4,
    'K' => 5,
    'J' => 8,
    'X' => 8,
    'Q' => 10,
    'Z' => 10,
  }.freeze
end
