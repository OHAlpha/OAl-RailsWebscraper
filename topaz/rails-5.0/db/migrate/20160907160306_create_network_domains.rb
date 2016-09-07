class CreateNetworkDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :network_domains do |t|
      t.string :name

      t.timestamps
    end
  end
end
