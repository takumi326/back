class Purpose < ApplicationRecord
    validates :title, presence: true
    validates :deadline, presence: true
end
