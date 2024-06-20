class CompletedRepetitionTask < ApplicationRecord
    belongs_to :task

    validates :completed_date, presence: true
end
