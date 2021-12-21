class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]


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

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diaries = current_user.diaries.find(params[:id])
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to user_path(@diaries.id)
    else
      render :edit
      
    end
    
  end

  private 

  def diary_params
    params.require(:diary).permit(:image,:content,:place).merge(user_id: current_user.id)
    
  end


end
