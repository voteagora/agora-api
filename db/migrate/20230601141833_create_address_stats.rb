class CreateAddressStats < ActiveRecord::Migration[7.0]
  def change
    create_table :address_stats do |t|
      t.string :address
      t.string :token
      t.float :tokens_owned, default: 0.0
      t.float :tokens_delegated, default: 0.0
      t.float :tokens_partial_delegated, default: 0.0
      t.float :tokens_liquid_delegated, default: 0.0
      t.float :total_voting_power, default: 0.0
      t.bigint :number_of_delegators, default: 0
      t.bigint :number_of_delegatees, default: 0
      t.timestamps
      t.index [:address, :token], unique: true
    end
  end
end
