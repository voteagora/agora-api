class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances, if_not_exists: true do |t|
      t.string :address, null: false
      t.string :token, null: false
      t.float :amount, null: false
      t.timestamps
    end
  end
end
