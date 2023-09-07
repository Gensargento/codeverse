class AddIsCompletedToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :is_completed, :boolean
  end
end
