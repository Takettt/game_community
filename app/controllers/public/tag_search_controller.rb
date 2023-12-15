class Public::TagSearchController < ApplicationController
  def tag_search
     @range_tag = params[:range_tag]

    if @range_tag == "Player"
      @player = Player.looks_tag(params[:search_tag], params[:word_tag])
    else
      @posts = Post.looks(params[:search_tag], params[:word_tag])
    end
  end
end
