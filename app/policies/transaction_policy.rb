class TransactionPolicy < ApplicationPolicy

  def index?
    user.present? 
  end

  def show?
    # pp '--------------------'
    # pp record
    # pp '--------------------'
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

  def create?
    # user.present? and user.accounts.includes?(transaction.account)
    user.present? && user == record.user
  end
end
