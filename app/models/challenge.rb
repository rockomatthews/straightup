class Challenge < ActiveRecord::Base
  after_initialize :set_defaults, unless: :persisted?
  belongs_to :user
  belongs_to :moderator
  has_one :gameroom

  def set_defaults
    self.challenge_accepted?  ||= 'false'
    self.challenge_complete?  ||= 'false'
  end
  
  validates :title, presence: true
  validates :event, presence: true
  validates :rules, presence: true
  validates :bet_amount, presence: true

end