class AddGameroomRefToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :gameroom, index: true, foreign_key: true
  end
end
