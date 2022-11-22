class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :account_no
      t.string :account_title
      t.integer :account_balance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :accounts, :account_no, unique: true
  end
end
