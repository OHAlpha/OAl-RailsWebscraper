class CreateContentContents < ActiveRecord::Migration[5.0]
  def change
    create_table :content_contents do |t|
      t.integer :avenue_id
      t.integer :source_id
      t.string :source_type
      t.integer :references_count

      t.timestamps
    end
  end
end
