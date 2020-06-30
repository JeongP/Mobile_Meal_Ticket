class Like < ApplicationRecord
  belongs_to :user
  belongs_to :lecture, counter_cache: true
end
