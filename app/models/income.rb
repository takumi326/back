class Income < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :classification, optional: true
    has_many :repetition_moneies, class_name: 'RepetitionMoney', foreign_key: 'income_id', dependent: :destroy

    validates :classification_id, presence: true
    validates :category_id, presence: true
    validates :schedule, presence: true
    validates :amount, presence: true
end
