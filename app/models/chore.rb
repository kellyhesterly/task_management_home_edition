class Chore < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates :name, :description, :task_time, presence: true
end
