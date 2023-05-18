class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.string :address, null: false
      t.string :proposal_uuid, null: false
      t.string :token, null: false
      t.integer :support, null: false
      t.float :amount, null: false
      t.text :reason
      t.timestamps
    end
  end
end
