class AddChallengeRefToGameroom < ActiveRecord::Migration
  def change
    add_reference :gamerooms, :challenge, index: true, foreign_key: true
  end
end
