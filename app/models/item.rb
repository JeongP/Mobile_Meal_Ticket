class Item < ApplicationRecord
	mount_uploader :image, ImageUploader
	enum status: { normal: 0, new_: 1, sale: 2, hot: 3}
	belongs_to :user
	def status_to_span(percent=nil)
		case status
		when "normal"
		when "new_"
			"<span class='new'>NEW</span>".html_safe
		when "sale"
			"<span class='sale'>30%</span>".html_safe
		when "hot"
			"<span class='hot'>HOT</span>".html_safe
		end
	end

	def self.generate_seeds
		img1 = "https://images.unsplash.com/photo-1504382262782-5b4ece78642b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=725a022e25933d5d334307e718f6ae35&auto=format&fit=crop&w=500&q=60"
		img2 = "https://images.unsplash.com/photo-1505253304499-671c55fb57fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a194e76b2970a942dbb29ba2548d95a0&auto=format&fit=crop&w=500&q=60"
		img3 = "https://images.unsplash.com/photo-1506279616042-87baff7956a5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b1e32b7315ed1f5743da3d03554e679c&auto=format&fit=crop&w=500&q=60"
		img4 = "https://images.unsplash.com/photo-1506459225024-1428097a7e18?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3ab4e25a36018838f63e828e5a4d5570&auto=format&fit=crop&w=500&q=60"

		1.times do |i|
			Item.create!(
				name: "#{i+1}번째 게시물",
				desc: "#{i+1}번째 게시물을 판매함니다.",
				remote_image_url: [img1, img2, img3, img4].sample,
				price: rand(10..100)*100,
				status: (0..3).to_a.sample
			)
		end
	end

end
