class SessionsController < ApplicationController
  def new; end

  def create
    session[:player_id] = player.id

    redirect_to params[:return_url]
  end

private

  def player
    @player ||= if params[:player_id]
      Player.find(params[:player_id])
    else
      Player.create!(player_params)
    end
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
