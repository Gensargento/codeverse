class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.integer :number
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
