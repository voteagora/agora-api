class CreateApiUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :api_users do |t|
      t.string :api_key, null: false, unique: true
      t.datetime :expires_at
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
  end
end
