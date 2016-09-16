# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160913195533) do

  create_table "content_content_documents", force: :cascade do |t|
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "content_content_uses", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "content_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "content_contents", force: :cascade do |t|
    t.integer  "usage_type"
    t.integer  "avenue_id"
    t.integer  "content_id"
    t.string   "content_type"
    t.integer  "references_count"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "content_documents", force: :cascade do |t|
    t.integer  "is_standalone"
    t.integer  "avenue_id"
    t.integer  "document_id"
    t.string   "document_type"
    t.integer  "contents_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "content_html_documents", force: :cascade do |t|
    t.string   "title"
    t.integer  "links_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "content_html_links", force: :cascade do |t|
    t.integer  "source_id"
    t.integer  "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_images", force: :cascade do |t|
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "network_accesses", force: :cascade do |t|
    t.string   "request_method",            default: "GET", null: false
    t.text     "request_auxillary_headers",                 null: false
    t.text     "request_cookie"
    t.text     "request_range"
    t.text     "request_body"
    t.integer  "request_length"
    t.string   "request_md5"
    t.string   "request_type"
    t.string   "request_subtype"
    t.integer  "response_code"
    t.text     "response_headers"
    t.text     "response_cookie"
    t.text     "response_body"
    t.string   "response_type"
    t.string   "response_subtype"
    t.datetime "created",                                   null: false
    t.datetime "accessed"
    t.datetime "lock_version"
    t.integer  "avenue_id",                                 null: false
    t.integer  "request_headers_id",                        null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "network_avenues", force: :cascade do |t|
    t.string  "protocol", default: "http", null: false
    t.text    "query",                     null: false
    t.string  "url",                       null: false
    t.integer "file_id",                   null: false
    t.index ["file_id", "protocol", "query"], name: "index_network_avenues_on_file_id_and_protocol_and_query", unique: true
    t.index ["file_id"], name: "index_network_avenues_on_file_id"
    t.index ["protocol"], name: "index_network_avenues_on_protocol"
    t.index ["query"], name: "index_network_avenues_on_query"
    t.index ["url"], name: "index_network_avenues_on_url", unique: true
  end

  create_table "network_checksum_types", force: :cascade do |t|
    t.string  "name",       null: false
    t.integer "bits",       null: false
    t.string  "value_eval", null: false
    t.string  "bits_eval",  null: false
    t.string  "hex_eval",   null: false
    t.index ["name"], name: "index_network_checksum_types_on_name", unique: true
  end

  create_table "network_checksums", force: :cascade do |t|
    t.integer  "value"
    t.binary   "bits"
    t.string   "hex",        null: false
    t.integer  "type_id",    null: false
    t.integer  "access_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_id"], name: "index_network_checksums_on_access_id"
    t.index ["hex"], name: "index_network_checksums_on_hex"
    t.index ["type_id", "access_id"], name: "index_network_checksums_on_type_id_and_access_id"
    t.index ["type_id"], name: "index_network_checksums_on_type_id"
  end

  create_table "network_domains", force: :cascade do |t|
    t.string  "name",      null: false
    t.integer "parent_id"
    t.index ["name"], name: "index_network_domains_on_name"
    t.index ["parent_id", "name"], name: "index_network_domains_on_parent_id_and_name", unique: true
    t.index ["parent_id"], name: "index_network_domains_on_parent_id"
  end

  create_table "network_files", force: :cascade do |t|
    t.string  "full_path",              null: false
    t.integer "port",      default: 80, null: false
    t.string  "url",                    null: false
    t.integer "host_id",                null: false
    t.integer "path_id",                null: false
    t.index ["full_path"], name: "index_network_files_on_full_path"
    t.index ["host_id", "full_path", "port"], name: "index_network_files_on_host_id_and_full_path_and_port", unique: true
    t.index ["host_id", "path_id", "port"], name: "index_network_files_on_host_id_and_path_id_and_port", unique: true
    t.index ["host_id"], name: "index_network_files_on_host_id"
    t.index ["path_id"], name: "index_network_files_on_path_id"
    t.index ["port"], name: "index_network_files_on_port"
    t.index ["url"], name: "index_network_files_on_url", unique: true
  end

  create_table "network_header_inclusions", force: :cascade do |t|
    t.integer "set_id",    null: false
    t.integer "header_id", null: false
    t.index ["header_id"], name: "index_network_header_inclusions_on_header_id"
    t.index ["set_id", "header_id"], name: "index_network_header_inclusions_on_set_id_and_header_id", unique: true
    t.index ["set_id"], name: "index_network_header_inclusions_on_set_id"
  end

  create_table "network_header_sets", force: :cascade do |t|
    t.text    "headers_string",   null: false
    t.integer "inclusions_count"
  end

  create_table "network_headers", force: :cascade do |t|
    t.string "header_name",  null: false
    t.text   "header_value", null: false
    t.index ["header_name", "header_value"], name: "index_network_headers_on_header_name_and_header_value", unique: true
    t.index ["header_name"], name: "index_network_headers_on_header_name"
    t.index ["header_value"], name: "index_network_headers_on_header_value"
  end

  create_table "network_hosts", force: :cascade do |t|
    t.string  "host_name", null: false
    t.integer "domain_id", null: false
    t.index ["domain_id"], name: "index_network_hosts_on_domain_id", unique: true
    t.index ["host_name"], name: "index_network_hosts_on_host_name", unique: true
  end

  create_table "network_jobs", force: :cascade do |t|
    t.integer  "priority",                 null: false
    t.integer  "size"
    t.integer  "downloaded",   default: 0, null: false
    t.string   "status",                   null: false
    t.string   "message",                  null: false
    t.text     "long_message",             null: false
    t.integer  "access_id",                null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["access_id"], name: "index_network_jobs_on_access_id"
  end

  create_table "network_paths", force: :cascade do |t|
    t.string  "name",      null: false
    t.integer "parent_id"
    t.index ["name"], name: "index_network_paths_on_name"
    t.index ["parent_id", "name"], name: "index_network_paths_on_parent_id_and_name", unique: true
    t.index ["parent_id"], name: "index_network_paths_on_parent_id"
  end

end
