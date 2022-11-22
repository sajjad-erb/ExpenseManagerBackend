class RenameAccountBalanceToBalanceInAccounts < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :account_balance, :balance
  end
end
