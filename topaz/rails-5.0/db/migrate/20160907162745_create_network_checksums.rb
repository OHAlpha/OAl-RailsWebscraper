class CreateNetworkChecksums < ActiveRecord::Migration[5.0]
  def change
    create_table :network_checksums do |t|
      t.integer :value
      t.binary :bits
      t.string :hex
      t.integer :type_id
      t.integer :access_id

      t.timestamps
    end
    add_index :network_checksums, :hex
    add_index :network_checksums, :type_id
    add_index :network_checksums, :access_id
    add_index :network_checksums, [:type_id,:access_id]
  end
end