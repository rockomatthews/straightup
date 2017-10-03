class User < ActiveRecord::Base
  has_secure_password
  has_one :wallet
  has_many :message
  has_many :challenge
  has_friendship
  after_initialize :set_defaults, unless: :persisted?

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..12 }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  

  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

  def set_defaults
    self.wins  ||= "0"
    self.losses ||= "0"
  end

  def kd_ratio
    if self.losses < 1
      self.wins
    else
      self.wins / self.losses
    end
  end

end
