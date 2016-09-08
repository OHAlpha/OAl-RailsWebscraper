class CreateNetworkHeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :network_headers do |t|
      t.string :header_name, null: false
      t.text :header_value, null: false

      #t.timestamps
    end
    add_index :network_headers, :header_name
    add_index :network_headers, :header_value
    add_index :network_headers, [:header_name,:header_value], unique: true
  end
end