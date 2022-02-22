class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]


  def show
    @nickname = current_user.nickname
    @diaries = current_user.diaries.page(params[:page]).per(10)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
