class Public::HomesController < ApplicationController
  before_action :authenticate_player!
  
  def top
    @posts = Post.all
  end

  def about
  end
end
