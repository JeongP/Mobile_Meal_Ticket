class HomeController < ApplicationController
	before_action :authenticate_user!, only: [:mypage]
  def index
  	@lectures = Lecture.all
		@hot_lectures = Lecture.joins(:likes).group("lectures.id").order("count(lectures.id) DESC").limit(3)

  end

	def ticket
		@shops = Shop.all
	end

	def show
		@shop = Shop.find(params[:id])
		@ticket = Buying.where(shop_id: @shop.id, user_id: current_user.id, use: true)
	end

	def buy
		@buying = Buying.new
		time = Time.new
		@month = time.month
		@day = time.day

	end

	def my

	end



	def create

	end



	def menu
		time = Time.new
		@month = time.month
		@day = time.day
		@buying = Buying.new

		# :title => notice.css('td.mon').text.strip
		# :link => "http://www.hongik.ac.kr/contents/www/cor/cafe_2.html" + notice.css('td.title a')[0]['href'].strip
		# writer => notice.css('td')[2].text.strip
		# created_on => notice.css('td')[3].text.strip
	end

  def mypage
  	# 현재 유저 id를 가진 녀석들을 ull에서 가져오고
  	# 거기의 lec 아이디로 강의에서 자료들 가져와야.함
  	# lectures_id = UserLectureListen.where(user_id: current_user.id).pluck(:lecture_id)
  	# @lectures_listen = Lecture.where(id: lectures_id)
    @lectures_listen = current_user.lectures_listening
    # @lectures_made = current_user.lectures_made
  	@lectures_made = current_user.tutor.try(:lectures) || []
  	# jjim_lectures_id = UserLectureJjim.where(user_id: current_user.id).pluck(:lecture_id)
    # @lectures_jjim = Lecture.where(id: jjim_lectures_id)
    @lectures_pick = current_user.lectures_pick
  end






end
