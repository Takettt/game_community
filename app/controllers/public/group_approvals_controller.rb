class Public::GroupApprovalsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @group_approval = current_player.group_approvals.new(group_id: params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    approval = current_player.group_approvals.new(group_id: params[:group_id], group_password: params[:group_approval][:group_password])
    approval.save!
    redirect_to public_group_path(@group), notice: "グループへ参加申請をしました"
  end

  def update
    # byebug
    @group = Group.find(params[:group_id])
    approval = GroupApproval.find(params[:approval_id])
    approval.update(status:params[:status])
    redirect_to public_group_path(@group), notice: ""
  end

  def destroy
    @group = Group.find(params[:group_id])
    approval = current_player.group_approvals.find_by(group_id: params[:group_id])
    approval.destroy
    redirect_to request.referer, alert: "グループへの参加申請を取消しました"
  end

  def reject
    @group = Group.find(params[:group_id])
    approval = GroupApproval.find(params[:approval_id])

    if approval.destroy
      redirect_to public_group_path(@group), notice: "グループへの参加を拒否しました"
    else
      redirect_to public_group_path(@group), alert: "削除中にエラーが発生しました"
    end
  end
end
