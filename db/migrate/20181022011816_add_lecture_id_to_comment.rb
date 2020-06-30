class AddLectureIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :lecture, foreign_key: true
  end
end
