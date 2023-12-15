class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @players = Player.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

   private
  def comment_params
    params.require(:comment).permit(:thought)
  end
end
