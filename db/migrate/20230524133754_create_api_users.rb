class CreateApiUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :api_users, if_not_exists: true do |t|
      t.string :api_key, unique: true
      t.datetime :expires_at
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
  end
end
