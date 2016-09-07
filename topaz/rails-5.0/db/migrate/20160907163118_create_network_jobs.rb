class CreateNetworkJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :network_jobs do |t|
      t.integer :priority
      t.integer :size
      t.integer :downloaded
      t.string :status
      t.string :message
      t.text :long_message
      t.integer :access_id

      t.timestamps
    end
  end
end
