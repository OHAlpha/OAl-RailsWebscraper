class CreateNetworkAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :network_accesses do |t|
      t.string :request_method, null: false, default: 'GET'
      t.text :request_auxillary_headers, null: false, default: {}
      t.text :request_cookie
      t.text :request_range
      t.text :request_body
      t.integer :request_length
      t.string :request_md5
      t.string :request_type
      t.integer :response_code
      t.text :response_headers
      t.text :response_cookie
      t.text :response_body
      t.datetime :created, null: false
      t.datetime :accessed
      t.datetime :lock_version
      t.integer :avenue_id, null: false
      t.integer :request_headers_id, null: false

      t.timestamps
    end
  end
end