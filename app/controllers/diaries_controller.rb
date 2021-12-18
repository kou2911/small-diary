class DiariesController < ApplicationController


  def index
  end

  def new
    @diary = Diary.new
    @date = Date.current.strftime("%Y年 %m月 %d日")
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def diary_params
    params.require(:diary).permit(:image,:content,:place).merge(user_id: current_user.id)
    
  end


end
