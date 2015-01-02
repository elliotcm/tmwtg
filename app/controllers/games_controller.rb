class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def create
    game = Game.create!
    Letter.create_starting_set(game.id)

    redirect_to game
  end
end
