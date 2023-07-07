class CreateEnsRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :ens_records, if_not_exists: true do |t|
      t.string :address, unique: true
      t.string :username, unique: true
      t.timestamps
      t.index :address
    end
  end
end
