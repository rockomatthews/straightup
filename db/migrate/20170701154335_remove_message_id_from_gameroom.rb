class RemoveMessageIdFromGameroom < ActiveRecord::Migration
  def change
    remove_column :gamerooms, :message_id, :integer
  end
end
