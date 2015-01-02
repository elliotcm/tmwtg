class GamesController < ApplicationController
  before_filter :require_login, only: [:player]

  def show
    @game = Game.find(params[:id])
  end

  def create
    game = Game.create!
    Letter.create_starting_set(game.id)

    redirect_to game
  end

  def index; end

  def player
    @game = Game.find(params[:game_id])

    respond_to do |format|
      format.html
      format.json do
        render json: {test: 'ok'}
      end
    end
  end

  def join
    game = Game.find(params[:game_id])

    game.players << current_player

    redirect_to game_player_path(game, current_player)
  end

  def start
    game = Game.find(params[:game_id])

    game.players.each do |player|
      player.fill_hand(game)
    end

    game.update_attribute(:lobby, false)

    redirect_to game
  end

private

  def require_login
    redirect_to new_session_path(return_url: request.env['PATH_INFO']) unless current_player
  end
end
