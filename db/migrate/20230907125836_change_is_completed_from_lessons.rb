class ChangeIsCompletedFromLessons < ActiveRecord::Migration[7.0]
  def change
    change_column :lessons, :is_completed, :boolean, default: false
  end
end
