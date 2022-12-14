class GroupExpensePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present? && user == record.users
  end

  def edit?
    user.present? && user == record.users
  end

  def update?
    user.present? && user == record.users
  end

  def destroy?
    user.present? && user == record.users
  end

  def create?
    user.present?
  end
end
