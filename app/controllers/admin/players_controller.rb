class Admin::PlayersController < ApplicationController
  
  def index
    @players = Player.all
  end 
  
  def show
    @player = Player.find(params[:id])
  end 
  
  def edit
    @player = Player.find(params[:id])
  end 
  
  def update
    @player = Player.find(params[:id])
    #render plain: player_params
    #return
    if @player.update!(player_params)
      redirect_to admin_players_path
    else
      render "edit"
    end
  end
  
   private
   def player_params
     params.require(:player).permit(:last_name, :first_name, :nickname, :email, :platform, :addicted_game, :play_style, :is_active)
   end
end