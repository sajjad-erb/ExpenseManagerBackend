class CreateGroupExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :group_expenses do |t|
      t.integer :amount
      t.integer :category
      t.integer :split
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end