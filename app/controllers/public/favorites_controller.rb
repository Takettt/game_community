class Public::FavoritesController < ApplicationController
  before_action :authenticate_player!
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_player.favorites.new(post_id: post.id)
    favorite.save
    redirect_to public_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_player.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to public_post_path(post)
  end
end
