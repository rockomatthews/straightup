class RemoveUsernameFromModerators < ActiveRecord::Migration
  def change
    remove_column :moderators, :username, :string
  end
end
