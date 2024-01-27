class Public::PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.all
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to public_player_path(@player)
    else
      render "edit"
    end
  end

  def favorites
    player = Player.find(params[:id])
    @favorite_posts = player.favorite_posts
  end

  def confirm
    @player = Player.find(current_player.id)
  end

  def leave
    @player = Player.find(current_player.id)
    @player.update(is_active: false)
    reset_session
    redirect_to new_player_registration_path, notice: "退会処理を実行いたしました。"
  end

  private
   def player_params
     params.require(:player).permit(:last_name, :first_name, :nickname, :email, :platform, :addicted_game, :play_style, :profile_image)
   end
end
