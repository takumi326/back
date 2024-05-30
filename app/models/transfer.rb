class Transfer < ApplicationRecord
  belongs_to :account, foreign_key: 'before_account_id'
  belongs_to :account, foreign_key: 'after_account_id'
  has_many :repetition_money, dependent: :destroy
end
