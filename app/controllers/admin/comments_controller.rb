class Admin::CommentsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post_comment = post.comment
    @player = Player.find(params[:id])
  end
  
  def index
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

   private
  def comment_params
    params.require(:comment).permit(:thought)
  end
end
