class Public::CommentsController < ApplicationController
  before_action :authenticate_player!
  
  def create
    post = Post.find(params[:post_id])
    comment = current_player.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
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
