class GroupExpense < ApplicationRecord
  belongs_to :group
  has_many :payers, dependent: :destroy
  has_many :users, through: :payers
  enum category: [:food, :transport, :accommodation, :shopping, :entertainement]
  enum split: [:equally, :percentage, :unequally]

  accepts_nested_attributes_for :payers, allow_destroy: true
end
