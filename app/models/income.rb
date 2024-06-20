class Income < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :classification, optional: true
    has_many :repetition_money, dependent: :destroy

    validates :classification_id, presence: true
    validates :category_id, presence: true
    validates :schedule, presence: true
    validates :amount, presence: true
end
