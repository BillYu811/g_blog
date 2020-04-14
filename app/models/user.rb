class User < ApplicationRecord
    has_many :blogs
    has_secure_password

    validates :name, uniqueness: { case_sensitive: false }, presence: true, format: { with: /\A[a-z0-9][a-z0-9-]*\z/i }
end
