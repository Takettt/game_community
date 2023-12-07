class Public::PlayersController < ApplicationController
  def show
    @player = current_player
    @player_name = @player.last_name + @player.first_name
    @player_nickname = @player.nickname
    @player_platform = @player.platform
    @player_addicted_game = @player.addicted_game
    @player_play_style = @player.play_style
  end

  def edit
  end

  def update
  end

  def confirm
    @player = Player.find(current_player.id)
  end

  def leave
    @player = Player.find(current_player.id)
    @player.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to new_player_registration_path
  end
  
  private
   def player_params
     params.require(:player).permit(:last_name, :first_name, :nickname, :email, :platform, :addicted_game, :play_style)
   end
end
