class User < ApplicationRecord
    has_secure_password
    has_many :chores
    has_many :categories, through: :chores

    validates :name, :email, :password, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :password, length: {minimum: 5}, on: :create
    validates_uniqueness_of :email
end
