class CreateContentContentDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :content_content_documents do |t|
      t.integer :document_id

      t.timestamps
    end
  end
end
