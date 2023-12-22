class Public::GroupPlayersController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @approval = GroupApproval.find(params[:approval_id])
    @group_player = GroupPlayer.create(player_id: @approval.player_id, group_id: params[:group_id])
    @approval.destroy #参加希望者リストから削除する
    redirect_to request.referer
  end

  def destroy
     group_player = GroupPlayer.find_by(player_id: current_player.id, group_id: params[:group_id])

    if group_player
      group_player.destroy
    else
      flash[:alert] = "グループから退出しました。"
    end

    redirect_to request.referer
  end
end
