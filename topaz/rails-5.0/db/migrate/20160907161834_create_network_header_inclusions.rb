class CreateNetworkHeaderInclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :network_header_inclusions do |t|
      t.integer :set_id
      t.integer :header_id

      t.timestamps
    end
  end
end
