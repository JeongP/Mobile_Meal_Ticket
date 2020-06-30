class Lecture < ApplicationRecord
	mount_uploader :image1, ImageUploader
	mount_uploader :image2, ImageUploader
	mount_uploader :image3, ImageUploader
	mount_uploader :image4, ImageUploader
	enum location: { 홍대: 0, 강남: 1}
	enum class_date: {월: 1,화: 2,수: 3,목: 4,금: 5}

	#페이지 당 게시물 수
	paginates_per 6
	belongs_to :tutor

	has_many :user_lecture_listens, dependent: :destroy

	# 좋아요 기능
	belongs_to :user
	has_many :likes
	has_many :like_users, through: :like, source: :user

	# 유저랙처리슨 관계테이블의 validation을 위해 기재.
	# has_many :user_lecture_listens
	# has_many :users, :through => :user_lecture_listens
	def self.seed

		img1 = "https://images.unsplash.com/photo-1509062522246-3755977927d7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1d5d43575cce36ed90f500d138fda96d&auto=format&fit=crop&w=500&q=60"
		img2 = "https://images.unsplash.com/photo-1503428593586-e225b39bddfe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=36c64b55cbc13bba1e00133b3fcbb8fd&auto=format&fit=crop&w=500&q=60"
		img3 = "https://images.unsplash.com/photo-1534152497021-d49e9a1feef7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=4a82c6b110cdbca0e7b73ad885bada92&auto=format&fit=crop&w=500&q=60"
		img4 = "https://images.unsplash.com/photo-1531816494000-90d3ae302088?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9282c24f85ff91a21774f542aafbc4d6&auto=format&fit=crop&w=500&q=60"
		img5 = "https://images.unsplash.com/photo-1528701202755-cf9158dc3da6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c072549944daeba2ee1229f21ecdd45e&auto=format&fit=crop&w=500&q=60"

		6.times do |i|
			Lecture.create!(
				title: "#{i+1}번째 게시물",
				remote_image1_url:  [img1, img2, img3, img4, img5].sample,
				category: ['보컬','코딩','댄스','랩'].sample,
				price: rand(100..300)*100,
				contents: "#{i+1}번 째 게시물의 내용.",
				possible_time: ["19~20","20~21","21~22"].sample,
				class_date: ["월","화","수","목","금"].sample,
				total_class_num: rand(1..5),
				location: ["홍대","강남"].sample,
				tutor_id: 6
			)
		end
	end
end
