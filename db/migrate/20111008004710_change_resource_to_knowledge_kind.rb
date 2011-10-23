class ChangeResourceToKnowledgeKind < ActiveRecord::Migration
  def up
    add_column :knowledges, :knowledge_kind, :string
    #rename_column :knowledges, :resource, :knowledge_kind # table name, old name, new name
  end

  def down
  end
end
