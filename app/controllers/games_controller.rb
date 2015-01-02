class GamesController < ApplicationController
  before_filter :require_login, only: [:hand]

  def show
    @game = Game.find(params[:id])
  end

  def create
    game = Game.create!
    Letter.create_starting_set(game.id)

    redirect_to game
  end

  def index; end

  def hand
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

    redirect_to game_hand_path(game)
  end

  def start
    game = Game.find(params[:game_id])

    game.players.each do |player|
      player.fill_hand(game)
    end

    game.update_attribute(:lobby, false)

    redirect_to game
  end

  def send_to
    if params[:letter_ids]
      game = Game.find(params[:game_id])

      letters = Letter.find(params[:letter_ids])

      letters.each do |letter|
        letter.update_attribute(:on_board, (params[:target] == 'board'))
      end
    end

    render json: {errors: []}
  end

private

  def require_login
    redirect_to new_session_path(return_url: request.env['PATH_INFO']) unless current_player
  end
end
