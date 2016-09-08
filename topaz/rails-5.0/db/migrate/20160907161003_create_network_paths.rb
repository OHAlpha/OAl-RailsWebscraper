class CreateNetworkPaths < ActiveRecord::Migration[5.0]
  def change
    create_table :network_paths do |t|
      t.string :name, null: false
      t.integer :parent_id

      #t.timestamps
    end
    add_index :network_paths, :name
    add_index :network_paths, :parent_id
    add_index :network_paths, [:parent_id,:name], unique: true
  end
end