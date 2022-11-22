class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :category
      t.integer :amount
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.references :transfer_from, polymorphic: true, null: true
      t.references :transfer_to, polymorphic: true, null: true

      t.timestamps
    end
  end
end
