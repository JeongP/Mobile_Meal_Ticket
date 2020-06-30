class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum user_type: {customer: 0, seller: 1}
  has_many :items
  has_one :tutor, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 대표님이 알려주신 has_many through 사용 법.
  has_many :user_lecture_listens, dependent: :destroy
  has_many :lectures_listening, through: :user_lecture_listens, source: :lecture
  # has_many :lectures_made, through: :user_lecture_listens, source: :lecture
  # has_many :lectures, through: :user_lecture_listens

  has_many :user_lecture_jjims, dependent: :destroy
  # 적용
  has_many :lectures_pick, through: :user_lecture_jjims, source: :lecture

  #좋아요
  has_many :lectures
  has_many :likes
  has_many :liked_lectures, through: :like, source: :lecture


  # 졸프
  has_many :notes


  # 관계테이블의 validation을 위해 설정해주는 조건.
  # has_many :user_lecture_listens
  # has_many :lectures, :through => :user_lecture_listens

  def listen? lecture
  	lectures_listening.include?(lecture)
  end

  def made? lecture
  	tutor && tutor.lectures.include?(lecture)
  end

  def is_like? (lecture)
    Like.find_by(user_id: self.id, lecture_id: lecture.id).present?
  end
end
