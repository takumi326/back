class RepetitionMoney < ApplicationRecord
    belongs_to :payment
    belongs_to :income
    belongs_to :transfer
end
