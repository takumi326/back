class Classification < ApplicationRecord
    has_many :payments, dependent: :nullify
    has_many :incomes, dependent: :nullify
    belongs_to :account, optional: true
end
