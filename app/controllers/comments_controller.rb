class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_back fallback_location: root_path
  end

  def destroy
    # Comment.find(params[:id]).destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :lecture_id)
  end
end
