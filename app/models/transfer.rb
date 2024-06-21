class Transfer < ApplicationRecord
  belongs_to :account, foreign_key: 'before_account_id'
  belongs_to :account, foreign_key: 'after_account_id'
  has_many :repetition_moneies, class_name: 'RepetitionMoney', foreign_key: 'transfer_id', dependent: :destroy

  validates :before_account_id, presence: true
  validates :after_account_id, presence: true
  validates :schedule, presence: true
  validates :amount, presence: true
end
