class Public::GroupApprovalsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @group_approval = current_player.group_approvals.new(group_id: params[:group_id])
  end
  
  def create
    @group = Group.find(params[:group_id])
    approval = current_player.group_approvals.new(group_id: params[:group_id])
    approval.save
    redirect_to public_group_path(@group), notice: "グループへ参加申請をしました"
  end
  
  def destroy
    approval = current_player.group_approvals.find_by(group_id: params[:group_id])
    approval.destroy
    redirect_to request.referer, alert: "グループへの参加申請を取消しました"
  end
end
