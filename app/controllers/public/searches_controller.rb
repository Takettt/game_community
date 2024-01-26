class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "player"
      @player = Player.playerlooks(params[:search], params[:word])
    else
      @posts = Post.postlooks(params[:search], params[:word])
    end
  end
end
