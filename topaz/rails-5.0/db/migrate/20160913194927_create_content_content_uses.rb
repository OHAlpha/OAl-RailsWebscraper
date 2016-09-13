class CreateContentContentUses < ActiveRecord::Migration[5.0]
  def change
    create_table :content_content_uses do |t|
      t.integer :document_id
      t.integer :content_id

      t.timestamps
    end
  end
end
