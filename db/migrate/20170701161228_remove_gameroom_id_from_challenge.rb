class RemoveGameroomIdFromChallenge < ActiveRecord::Migration
  def change
    remove_column :challenges, :gameroom_id, :integer
  end
end
