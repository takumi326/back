class Task < ApplicationRecord
    belongs_to :purpose, optional: true
    has_many :completed_repetition_task, dependent: :destroy

    validates :title, presence: true
    validates :schedule, presence: true
end
