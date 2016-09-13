class CreateContentDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :content_documents do |t|
      t.integer :avenue_id
      t.integer :source_id
      t.string :source_type
      t.integer :contents_count

      t.timestamps
    end
  end
end
