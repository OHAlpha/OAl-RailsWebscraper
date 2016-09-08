class CreateNetworkPaths < ActiveRecord::Migration[5.0]
  def change
    create_table :network_paths do |t|
      t.string :name
      t.integer :parent_id

      #t.timestamps
    end
  end
end
