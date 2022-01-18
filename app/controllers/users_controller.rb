class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @new_book = Book.new
    @users = User.all
    @user = current_user
    # @user = User.find(curren_user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
    # @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
