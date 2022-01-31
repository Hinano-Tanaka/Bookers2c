class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def new
  end
  
  def create
  end
  
  def index
    @groups = Group.all
  end
  
  def update
  end
    
  private
  
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end
  
end
