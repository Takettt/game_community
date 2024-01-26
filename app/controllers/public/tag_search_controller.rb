class Public::TagSearchController < ApplicationController
  def tag_search
      @posts = Post.postlooks_tag(params[:search_tag], params[:word_tag])
  end
end
