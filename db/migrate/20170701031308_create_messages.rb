class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user1, index: true, foreign_key: true
      t.references :user2, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
