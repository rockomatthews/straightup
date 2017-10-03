class RenameUsernameToEmail < ActiveRecord::Migration
  def change
    rename_column :moderators, :username, :email if column_exists?(:moderators, :username)
  end
  
end

