class Comment < ApplicationRecord
  belongs_to :user

  # 페이지당 개수 설정
  paginates_per 8

  def self.seed
    20.times do |i|
      userid = User.order("RANDOM()").limit(1).pluck(:id).sample
      Comment.create!(
        user_id: userid,
        body: "#{i+1}번 째 댓글입니다 "
      )
    end
  end

  def self.update_seed
    Comment.all.each do |comment|
      lecture_id = Lecture.order("RANDOM()").limit(1).pluck(:id).sample
      comment.lecture_id = lecture_id
      comment.save
    end
  end

end
