class CreateEnsRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :ens_records do |t|
      t.string :address, unique: true
      t.string :username, unique: true
      t.timestamps
    end
  end
end
