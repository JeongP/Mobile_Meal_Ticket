class UserLectureListen < ApplicationRecord
  belongs_to :user
  belongs_to :lecture
end
