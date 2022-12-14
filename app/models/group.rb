class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :group_expenses

  accepts_nested_attributes_for :user_groups, allow_destroy: true
end
