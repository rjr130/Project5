class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :username
      t.string :password
      t.string :host

      t.timestamps
    end
    add_index :accounts, [:user_id, :created_at]
  end
end
