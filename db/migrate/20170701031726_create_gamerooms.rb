class CreateGamerooms < ActiveRecord::Migration
  def change
    create_table :gamerooms do |t|
      t.integer :money
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
