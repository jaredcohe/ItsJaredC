class CreateKnowledges < ActiveRecord::Migration
  def change
    create_table :knowledges do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id
      t.integer :kind
      t.boolean :free

      t.timestamps
    end
  end
end
