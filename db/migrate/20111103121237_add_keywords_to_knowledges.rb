class AddKeywordsToKnowledges < ActiveRecord::Migration
  def up
    add_column :knowledges, :keywords, :text #table name, column name, data type
  end
  
  def down
    remove_column :knowledges, :keywords
  end
end
