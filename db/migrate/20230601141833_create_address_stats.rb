class CreateAddressStats < ActiveRecord::Migration[7.0]
  def change
    create_table :address_stats do |t|
      t.string :address
      t.string :token
      t.float :tokens_owned
      t.float :tokens_delegated
      t.float :tokens_partial_delegated
      t.float :tokens_liquid_delegated
      t.float :total_voting_power
      t.timestamps
      t.index [:address, :token], unique: true
    end
  end
end
