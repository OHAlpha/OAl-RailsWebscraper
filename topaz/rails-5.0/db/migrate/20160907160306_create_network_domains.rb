class CreateNetworkDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :network_domains do |t|
      t.string :name, null: false
      t.integer :parent_id

      #t.timestamps
    end
    add_index :network_domains, :name
    add_index :network_domains, :parent_id
    add_index :network_domains, [:parent_id,:name], unique: true
  end
end
