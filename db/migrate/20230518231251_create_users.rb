class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :address, unique: true, null: false
      t.timestamps
    end
    add_index :users, :account, unique: true
  end
end
