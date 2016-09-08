class CreateNetworkHeaderSets < ActiveRecord::Migration[5.0]
  def change
    create_table :network_header_sets do |t|
      t.text :headers_string, null: false
      t.integer :inclusions_count

      #t.timestamps
    end
  end
end