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
      redirect_to public_posts_completion_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def posting
    @posts = Post.where(today_tension: params[:value])
  end

  def index
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
    if @post.update(post_params)
      redirect_to public_post_path(@post), notice: "投稿の編集に成功しました。"
    else
      flash.now[:alert] = "投稿の編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_top_path
  end

  private
  def post_params
     params.require(:post).permit(:game_name, :participate_number, :start_time, :ending_time, :today_tension, :content, :posting_option )
  end
end