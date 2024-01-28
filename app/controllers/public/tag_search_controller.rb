class Public::TagSearchController < ApplicationController
  before_action :authenticate_player!
  
  def tag_search
      @posts = Post.postlooks_tag(params[:search_tag], params[:word_tag])
  end
end