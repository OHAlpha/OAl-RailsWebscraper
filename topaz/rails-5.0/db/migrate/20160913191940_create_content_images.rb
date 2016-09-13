class CreateContentImages < ActiveRecord::Migration[5.0]
  def change
    create_table :content_images do |t|
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
