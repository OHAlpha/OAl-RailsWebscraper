class CreateNetworkAvenues < ActiveRecord::Migration[5.0]
  def change
    create_table :network_avenues do |t|
      t.string :protocol, null: false, default: 'http'
      t.text :query
      t.string :url, null: false
      t.integer :file_id, null: false

      #t.timestamps
    end
    add_index :network_avenues, :protocol
    add_index :network_avenues, :query
    add_index :network_avenues, :url, unique: true
    add_index :network_avenues, :file_id
    add_index :network_avenues, [:file_id,:protocol,:query], unique: true
  end
end