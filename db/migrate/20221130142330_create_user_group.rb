class CreateUserGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.timestamps
    end
  end
end
