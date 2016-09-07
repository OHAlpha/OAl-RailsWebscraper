class CreateNetworkChecksumTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :network_checksum_types do |t|
      t.string :name
      t.integer :bits

      #t.timestamps
    end
  end
end
