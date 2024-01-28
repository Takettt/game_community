class Public::PlayersController < ApplicationController
  before_action :authenticate_player!
  before_action :is_matching_login_player, only: [:edit, :update, :delete]

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
    @post = Post.find(params[:id])
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
    def is_matching_login_player
      @player = Player.find_by(id: params[:id])
        if @player != current_player
          redirect_to public_top_path
        end
    end

    def player_params
      params.require(:player).permit(:last_name, :first_name, :nickname, :email, :platform, :addicted_game, :play_style, :profile_image)
    end
end
