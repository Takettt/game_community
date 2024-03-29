class Public::PostsController < ApplicationController
  before_action :authenticate_player!
  before_action :is_matching_login_player, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    @post.player_id = current_player.id
    if !@post.valid?
      return render :new
    end
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
   @posts = current_player.posts
  end

  def show
    if params[:id] == "confirm"
      redirect_to new_public_post_path
    else
      @post = Post.find(params[:id])
      @comment = Comment.new
    end
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
  def is_matching_login_player
    @post = current_player.posts.find_by(id: params[:id])
      unless @post
        redirect_to public_top_path
      end
  end

  def post_params
     params.require(:post).permit(:game_name, :participate_number, :start_time, :ending_time, :today_tension, :content, :posting_option, :game_genre )
  end
end