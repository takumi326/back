class Account < ApplicationRecord
    has_many :transfers_as_before, class_name: 'Transfer', foreign_key: 'before_account_id', dependent: :destroy
    has_many :transfers_as_after, class_name: 'Transfer', foreign_key: 'after_account_id', dependent: :destroy
    has_many :classifications, dependent: :nullify

    validates :name, presence: true
    validates :amount, presence: true
end
