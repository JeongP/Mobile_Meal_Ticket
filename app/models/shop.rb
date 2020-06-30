class Shop < ApplicationRecord

  def self.seed

    Shop.create!(name: "제2기숙사", img: "" , tel: "02-320-2452", location: "제2기숙사 지하2층", runningtime: 0)
    Shop.create!(name: "남문관", img: "" , tel: "02-320-2452", location: "제2기숙사 지하2층", runningtime: 0)
    Shop.create!(name: "교직원식당", img: "" , tel: "02-320-1560", location: "제2기숙사 지하2층", runningtime: 0)
    Shop.create!(name: "학생회관식", img: "" , tel: "02-320-2452", location: "제2기숙사 지하2층", runningtime: 0)

  end

end
