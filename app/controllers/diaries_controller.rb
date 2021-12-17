class DiariesController < ApplicationController


  def index
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end


end
