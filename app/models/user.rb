class User < ApplicationRecord
    validates :username, :email, :password, presence: {message: "%{attribute} cannot be blank."}
    validates :username, length: { minimum: 6, maximum: 12, message: "%{attribute} must be between 6 and 12 characters long." }
    validates :username, uniqueness: {message: "%{attribute}s must be unique, and %{value} has already been taken."}
    has_secure_password
end
