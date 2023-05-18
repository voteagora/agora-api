class CreateDelegations < ActiveRecord::Migration[7.0]
  def change
    create_table :delegations do |t|
      t.string :delegator_addr, null: false
      t.string :delegatee_addr, null: false
      t.string :token, null: false
      t.float :amount, null: false
      t.string :status
      t.timestamps
    end
  end
end
