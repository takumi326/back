class Classification < ApplicationRecord
    has_many :payments, dependent: :nullify
    has_many :incomes, dependent: :nullify
    has_many :classificationMonthlyAmount, dependent: :destroy
    belongs_to :account, optional: true

    validates :name, presence: true
    validates :classification_type, presence: true
end
