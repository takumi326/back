class Payment < ApplicationRecord
    belongs_to :category
    belongs_to :classification
end
