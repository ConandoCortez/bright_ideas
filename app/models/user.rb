class User < ActiveRecord::Base
    has_many :ideas
    has_many :likes, dependent: :destroy
    has_many :ideas_liked, through: :likes, source: :idea

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    has_secure_password
    validates :name, :alias, :password, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX}
end
