class CreateContentContents < ActiveRecord::Migration[5.0]
  def change
    create_table :content_contents do |t|
      t.integer :usage_type
      t.integer :avenue_id
      t.integer :content_id
      t.string :content_type
      t.integer :references_count

      t.timestamps
    end
  end
end
