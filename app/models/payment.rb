class Payment < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :classification, optional: true
end
