class Income < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :classification, optional: true
    has_many :repetition_money, dependent: :destroy
end
