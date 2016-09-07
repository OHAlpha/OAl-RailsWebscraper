class CreateNetworkFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :network_files do |t|
      t.string :full_path
      t.integer :port
      t.string :url
      t.integer :host_id
      t.integer :path_id

      #t.timestamps
    end
  end
end
