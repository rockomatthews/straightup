class Gameroom < ActiveRecord::Base
  has_many :message
  belongs_to :challenge
end
