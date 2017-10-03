class AddWalletRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :wallet, index: true, foreign_key: true
  end
end
