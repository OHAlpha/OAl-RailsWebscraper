class CreateNetworkAvenues < ActiveRecord::Migration[5.0]
  def change
    create_table :network_avenues do |t|
      t.string :protocol
      t.text :query
      t.string :url
      t.integer :file_id

      t.timestamps
    end
  end
end
