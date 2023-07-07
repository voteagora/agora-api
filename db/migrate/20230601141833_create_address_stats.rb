class CreateAddressStats < ActiveRecord::Migration[7.0]
  def change
    change_table :address_stats, if_not_exists: true do |t|
      t.string :token
      t.index [:account, :token], unique: true
    end
  end
end
