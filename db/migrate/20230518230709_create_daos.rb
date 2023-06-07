class CreateDaos < ActiveRecord::Migration[7.0]
  def change
    create_table :daos do |t|
      t.string :name, unique: true, null: false
      t.string :token, unique: true, null: false
      t.string :chain, null: false
      t.timestamps
    end
  end
end
