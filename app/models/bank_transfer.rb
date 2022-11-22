class BankTransfer < Transaction
  # before_save :nil_extra_columns

  # def nil_extra_columns
  #   self.category = nil
  # end
end
