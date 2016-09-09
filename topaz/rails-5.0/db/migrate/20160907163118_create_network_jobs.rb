class CreateNetworkJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :network_jobs do |t|
      t.integer :priority, null: false, default: Network::Job.default_priority
      t.integer :size
      t.integer :downloaded, null: false, default: 0
      t.string :status, null: false, default: Network::Job.initial_status
      t.string :message, null: false, default: Network::Job.initial_message
      t.text :long_message, null: false, default: Network::Job.initial_long_message
      t.integer :access_id, null: false

      t.timestamps
    end
    add_index :network_jobs, :access_id
  end
end