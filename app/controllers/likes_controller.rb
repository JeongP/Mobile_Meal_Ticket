class LikesController < ApplicationController

  def like_toggle
    like = Like.find_by(user_id: current_user.id, lecture_id: params[:id])
    if like.nil?
      Like.create(user_id: current_user.id, lecture_id: params[:id])
    else
      like.destroy
    end
    redirect_back fallback_location: root_path
  end
end
