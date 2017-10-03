class RemoveHasWalletNumberFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :has_wallet?, :boolean
  end
end
