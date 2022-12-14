class GroupPolicy < ApplicationPolicy
  def index?
    user.present? 
  end

  def show?
    user.present? 
  end

  def edit?
    user.present? && record.users.ids.any? {|id| user.id == id}
  end

  def update?
    user.present? && record.users.ids.any? {|id| user.id == id}
  end

  def destroy?
    user.present?
  end

  def create?
    user.present? 
  end
end
