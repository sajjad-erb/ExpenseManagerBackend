class Account < ApplicationRecord
  validates :balance, presence: true
  validates :account_no, presence: true
  validates :account_title, presence: true
  validates :balance, numericality: { greater_than: -1 }

  belongs_to :user
  has_many :transactionsfrom, as: :transfer_from
  has_many :transactionsto, as: :transfer_to
end
