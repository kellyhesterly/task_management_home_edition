class User < ApplicationRecord
    has_secure_password
    has_many :chores
    has_many :categories, through: :chores

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :password, presence: true, length: {minimum: 5}, on: :create
end