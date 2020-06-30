class TutorsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
  def new
  	@tutor = Tutor.new
  end

  def create
  	tutor = Tutor.new(tutor_params)
  	tutor.save
  	redirect_to lectures_path
  end

  private
  def load_obj

  end

  def tutor_params
  	params.require(:tutor).permit(:image1, :phone, :user_id)
  end
end
