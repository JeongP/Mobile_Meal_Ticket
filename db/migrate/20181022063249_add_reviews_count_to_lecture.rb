class AddReviewsCountToLecture < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :reviews_count, :integer, default: 0
  end
end
