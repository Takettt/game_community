class Public::RelationshipsController < ApplicationController
before_action :authenticate_player!
  def create
    player = Player.find(params[:player_id])
    current_player.follow(player)
    redirect_to request.referer
  end

  def destroy
    player = Player.find(params[:player_id])
    current_player.unfollow(player)
    redirect_to  request.referer
  end

  def followings
    player = Player.find(params[:player_id])
    @players = player.followings
  end

  def followers
    player = Player.find(params[:player_id])
    @players = player.followers
  end
end
