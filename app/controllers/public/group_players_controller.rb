class Public::GroupPlayersController < ApplicationController
  before_action :authenticate_player!
  def create
    @group = Group.find(params[:group_id])
    @approval = GroupApproval.find(params[:group_approval_id])
    @group_player = GroupPlayer.create(player_id: @approval.player_id, group_id: params[:group_id])
    @approval.destroy #参加希望者リストから削除する
    redirect_to request.referer
  end

  def destroy
  end
end
