class ClassificationMonthlyAmount < ApplicationRecord
    self.table_name = "classification_monthlyamounts"
    belongs_to :classification

    validates :amount, presence: true
    validates :month, presence: true
end
