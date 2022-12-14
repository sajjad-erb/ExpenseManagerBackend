class CreatePayers < ActiveRecord::Migration[7.0]
  def change
    create_table :payers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group_expense, index: true
      t.integer :payable
      t.integer :paid
      t.timestamps
    end
  end
end
