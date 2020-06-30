class UserLectureListensController < ApplicationController
	before_action :authenticate_user!

  def create
    # puts params
  	UserLectureListen.find_or_create_by!(lecture_id: params[:lecture_id], user_id: current_user.id)
    # 수업 신청하면 찜 한 강의 취소.
    jjimLecture = UserLectureJjim.find_by(lecture_id: params[:lecture_id])
    if jjimLecture.present?
      jjimLecture.destroy
    end
  	redirect_to lectures_path
  end

  def destroy
    UserLectureListen.find_by(lecture_id: params[:id]).destroy
    redirect_to "/home/mypage"
  end

  def index
  	
  end
end
