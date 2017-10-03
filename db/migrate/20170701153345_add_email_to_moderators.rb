class AddEmailToModerators < ActiveRecord::Migration
  def change
    add_column :moderators, :email, :string
  end
end