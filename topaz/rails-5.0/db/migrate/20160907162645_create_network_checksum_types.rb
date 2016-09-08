class CreateNetworkChecksumTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :network_checksum_types do |t|
      t.string :name
      t.integer :bits

      #t.timestamps
    end
    add_index :network_checksum_types, :name, unique: true
  end
end