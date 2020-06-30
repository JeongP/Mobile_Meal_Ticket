class UserLectureJjimsController < ApplicationController
	before_action :authenticate_user!
  def create
  	UserLectureJjim.find_or_create_by!(lecture_id: params[:lecture_id], user_id: current_user.id)
  	# puts params
  	redirect_to lectures_url
  end

  def destroy
  	UserLectureJjim.find_by(lecture_id: params[:id]).destroy
    redirect_to "/home/mypage.html"
  end
end
