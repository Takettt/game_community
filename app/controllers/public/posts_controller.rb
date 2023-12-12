class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
  end

  def completion
  end

  def create
     @post = Post.new(post_params)
     @post.player_id = current_player.id
    if @post.save
      #redirect_to public_posts_completion_path
      redirect_to public_posts_completion_path
    else
      render new
    end
  end

  def index
    # @posts = Post.where(Post.player_id = current_player.post_id).all
    @posts = Post.where("player_id = ?",current_player.id)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update
  end

  def destroy
  end

  private
  def post_params
     params.require(:post).permit(:game_name, :participate_number, :start_time, :ending_time, :today_tension, :content )
  end
end
