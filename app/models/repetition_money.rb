class RepetitionMoney < ApplicationRecord
    belongs_to :payment, optional: true
    belongs_to :income, optional: true
    belongs_to :transfer, optional: true
end
