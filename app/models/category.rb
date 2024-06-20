class Category < ApplicationRecord
    has_many :payments, dependent: :nullify
    has_many :incomes, dependent: :nullify
    
    validates :name, presence: true
end
