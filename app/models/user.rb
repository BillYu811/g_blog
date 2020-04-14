class User < ApplicationRecord
    has_many :blogs
    has_secure_password

    validates :name, presence: true

end
