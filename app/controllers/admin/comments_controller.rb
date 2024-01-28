class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.where(post_id: params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

   private
  def comment_params
    params.require(:comment).permit(:thought)
  end
end
