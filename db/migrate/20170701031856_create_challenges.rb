class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :event
      t.text :rules
      t.integer :bet_amount
      t.boolean :challenge_accepted?
      t.boolean :challenge_complete?
      t.references :user1, index: true, foreign_key: true
      t.references :user2, index: true, foreign_key: true
      t.references :moderator, index: true, foreign_key: true
      t.references :gameroom, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
