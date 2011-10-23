class CreateSubcategorizations < ActiveRecord::Migration
  # rails generate scaffold Subcategorization knowledge_id:integer subcategory_id:integer
  def change
    create_table :subcategorizations do |t|
      t.integer :knowledge_id
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
