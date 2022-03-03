class User < ApplicationRecord
    has_secure_password

    validates :name, :email, :password, presence: true

    has_many :chores
    has_many :categories, through: :chores
end
