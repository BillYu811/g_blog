class User < ApplicationRecord
  has_many :blogs
  has_secure_password
  validates :name, uniqueness: {case_sensitive: false}, presence: true, format: {with: /\A[a-z0-9][a-z0-9-]*\z/i}
  validates :password, presence: true, length: {minimum: 6, too_short: "need 6 characters at least."}

  def token
    #use ID to build JWT token.
    Token.encode id: self.id
  end

end
