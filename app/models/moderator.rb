class Moderator < ActiveRecord::Base
    has_secure_password
    has_many :challenge

 EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :email, presence: true

end
