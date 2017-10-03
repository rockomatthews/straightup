class AddHasWalletColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_wallet?, :boolean
  end
end
