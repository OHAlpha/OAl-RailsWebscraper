class CreateContentDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :content_documents do |t|
      t.integer :is_standalone
      t.integer :avenue_id
      t.integer :document_id
      t.string :document_type
      t.integer :contents_count

      t.timestamps
    end
  end
end
