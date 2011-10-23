class CreateCategorizations < ActiveRecord::Migration
  # rails generate scaffold Categorization knowledge_id:integer category_id:integer
  def change
    create_table :categorizations do |t|
      t.integer :knowledge_id
      t.integer :category_id

      t.timestamps
    end
  end
end
