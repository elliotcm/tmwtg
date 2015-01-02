class Player < ActiveRecord::Base
  has_many :letters

  MAX_HAND = 7

  def fill_hand(game)
    number = (MAX_HAND - self.letters.count)

    available_letters = Letter.where(game_id: game.id, player_id: nil).to_a
    available_letters.sample(number).each do |letter|
      self.letters << letter
    end
  end
end
