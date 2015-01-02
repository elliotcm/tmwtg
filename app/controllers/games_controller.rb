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
    render json: {test: 'ok'}
  end

private

  def require_login
    redirect_to new_session_path(return_url: request.env['PATH_INFO']) unless current_player
  end
end
