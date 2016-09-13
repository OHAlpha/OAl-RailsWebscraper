class CreateContentHtmlLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :content_html_links do |t|
      t.integer :source_id
      t.integer :target_id

      t.timestamps
    end
  end
end
