class Public::GroupsController < ApplicationController

  before_action :authenticate_player!
  before_action :ensure_correct_player, only: [:edit, :update, :approval]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_player.id
    if @group.save
      redirect_to public_groups_path
    else
      render 'new'
    end
  end

  def approvals
    @group = Group.find(params[:id])
    @approval = @group.group_approvals
  end

  def index
    @groups = Group.all
    @player = Player.find(current_player.id)
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
  end

  def update
    
    if @group.update(group_params)
      redirect_to public_groups_path
    else
      render "edit"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to public_groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction)
  end

  def ensure_correct_player
    @group = Group.find(params[:id])
    unless @group.owner_id == current_player.id
       redirect_to public_groups_path
    end
  end
end
