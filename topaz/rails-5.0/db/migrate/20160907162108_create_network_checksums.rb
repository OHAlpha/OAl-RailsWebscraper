class CreateNetworkChecksums < ActiveRecord::Migration[5.0]
  def change
    create_table :network_checksums do |t|
      t.integer :value
      t.binary :bits
      t.string :hex
      t.integer :type_id

      t.timestamps
    end
  end
end
