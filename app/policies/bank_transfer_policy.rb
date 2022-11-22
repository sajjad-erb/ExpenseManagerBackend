class BankTransferPolicy < TransactionPolicy
  def index?
    user.present? 
  end
  
  def show?
    user.present? && user == record.user
  end

  def edit?
    user.present? && user == record.user
  end

  def update?
    user.present? && user == record.user
  end

  def destroy?
    user.present? && user == record.user
  end
end
