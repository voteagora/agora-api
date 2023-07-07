class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals, if_not_exists: true do |t|
      t.string :uuid, null: false
      t.string :proposer_addr, null: false
      t.string :token, null: false
      t.text :targets
      t.text :values
      t.text :signatures
      t.text :calldata
      t.bigint :start_block
      t.bigint :end_block
      t.text :description
      t.string :kind, default: "agora_standard"

      t.timestamps
    end
  end
end
