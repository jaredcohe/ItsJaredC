class AddKnowledgeStringIdToKnowledge < ActiveRecord::Migration
  def change
    add_column :knowledges, :knowledge_string_id, :string #table name, column name, data type
  end
end
