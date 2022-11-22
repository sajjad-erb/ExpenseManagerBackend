class Income < Transaction
  # before_save :nil_extra_columns

  # def nil_extra_columns
  #   self.transfer_from = nil
  #   self.category = nil
  # end
end
