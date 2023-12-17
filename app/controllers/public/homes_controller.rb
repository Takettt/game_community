class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
    #@post = Post.find(params[:id])
  end

  def about
  end
end
