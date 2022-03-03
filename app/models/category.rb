class Category < ApplicationRecord
    has_many :chores
    has_many :users, through: :chores 

    validates :name, presence: true
end
