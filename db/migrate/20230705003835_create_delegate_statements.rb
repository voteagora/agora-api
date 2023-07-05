class CreateDelegateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :delegate_statements do |t|
      t.string :address, null: false
      t.text :statement, null: false
      t.string :token, null: false
      t.timestamps
    end
  end
end
