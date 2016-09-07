class CreateNetworkHeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :network_headers do |t|
      t.string :header_name
      t.text :header_value

      t.timestamps
    end
  end
end
