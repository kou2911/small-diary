class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @diaries = current_user.diaries
  end
end
