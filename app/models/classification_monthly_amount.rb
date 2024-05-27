class ClassificationMonthlyAmount < ApplicationRecord
    self.table_name = "classification_monthlyamounts"
    belongs_to :classification
end
