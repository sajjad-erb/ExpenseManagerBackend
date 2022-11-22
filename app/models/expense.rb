class Expense < Transaction
  validates :category, presence: true
  # before_save :nil_extra_columns

  # def nil_extra_columns
  #   self.transfer_to = nil
  # end
end
