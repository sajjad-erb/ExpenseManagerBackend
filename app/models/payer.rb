class Payer < ApplicationRecord
    belongs_to :user
    belongs_to :group_expense
end