class CreateNetworkChecksumTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :network_checksum_types do |t|
      t.string :name, null: false
      t.integer :bits, null: false
      t.string :value_eval, null: false
      t.string :bits_eval, null: false
      t.string :hex_eval, null: false

      #t.timestamps
    end
    add_index :network_checksum_types, :name, unique: true
  end
end