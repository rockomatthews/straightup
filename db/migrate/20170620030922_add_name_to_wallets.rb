class AddNameToWallets < ActiveRecord::Migration
  def change
    add_column :wallets, :name, :string
  end
end
