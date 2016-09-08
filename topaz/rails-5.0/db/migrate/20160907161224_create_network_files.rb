class CreateNetworkFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :network_files do |t|
      t.string :full_path, null: false
      t.integer :port, null: false, default: 80
      t.string :url, null: false
      t.integer :host_id, null: false
      t.integer :path_id, null: false

      #t.timestamps
    end
    add_index :network_files, :full_path
    add_index :network_files, :port
    add_index :network_files, :url, unique: true
    add_index :network_files, :host_id
    add_index :network_files, :path_id
    add_index :network_files, [:host_id,:full_path,:port], unique: true
    add_index :network_files, [:host_id,:path_id,:port], unique: true
  end
end