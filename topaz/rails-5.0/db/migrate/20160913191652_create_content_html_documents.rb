class CreateContentHtmlDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :content_html_documents do |t|
      t.string :title
      t.integer :links_count

      t.timestamps
    end
  end
end
