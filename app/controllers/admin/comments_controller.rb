class Admin::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:id])
    @comment = Comment.find(parms[:id])
    @player = Player.find(params[:id])
    @comment_post = post.comment
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
