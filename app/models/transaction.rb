class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :transfer_from, polymorphic: true, optional: true
  belongs_to :transfer_to, polymorphic: true, optional: true
  self.per_page = 5

  enum category: [:food, :transport, :accommodation, :shopping, :entertainement]
end
