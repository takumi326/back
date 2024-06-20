class RepetitionMoney < ApplicationRecord
    belongs_to :payment, optional: true
    belongs_to :income, optional: true
    belongs_to :transfer, optional: true

    validates :transaction_type, presence: true
    validates :amount, presence: true
    validates :repetition_schedule, presence: true
end