class CreateNetworkHeaderInclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :network_header_inclusions do |t|
      t.integer :set_id, null: false
      t.integer :header_id, null: false

      #t.timestamps
    end
    add_index :network_header_inclusions, :set_id
    add_index :network_header_inclusions, :header_id
    add_index :network_header_inclusions, [:set_id,:header_id], unique: true
  end
end