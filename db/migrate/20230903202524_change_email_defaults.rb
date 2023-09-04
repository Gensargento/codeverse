class ChangeEmailDefaults < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :email, unique: true
  end
end
