class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :kind
      t.string :token
      t.string :address
      t.jsonb :event_data
      t.timestamps
    end
  end
end
