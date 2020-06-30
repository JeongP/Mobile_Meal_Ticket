class LecturesController < ApplicationController
	before_action :authenticate_user!, only: [:new]
  before_action :load_obj, only: [:show]
  def index
    @lectures = Lecture.order(:id).page params[:page]
  end

  def new
  	@lecture = Lecture.new
  end

  def create
    lecture = Lecture.new(lec_params)
    lecture.save
    redirect_to lectures_path
  end

  def show
		@comments = Comment.where(lecture_id: @lecture.id).order("created_at DESC").page params[:page]
  end

  def edit
  end

  def destroy
    Lecture.find(params[:id]).destroy
    redirect_to "/home/mypage"
  end

  private
  def lec_params
    params.require(:lecture).permit(:title, :image1, :category, :price, :contents, :possible_time, :class_date, :total_class_num, :location, :tutor_id)
  end

  def load_obj
    @lecture = Lecture.find(params[:id])
  end
end
