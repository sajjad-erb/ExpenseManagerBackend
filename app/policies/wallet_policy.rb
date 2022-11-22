class WalletPolicy < ApplicationPolicy
  def index?
     user.present?
  end
end
