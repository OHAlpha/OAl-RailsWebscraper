class CreateNetworkHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :network_hosts do |t|
      t.string :host_name

      t.timestamps
    end
  end
end
