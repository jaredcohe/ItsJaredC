class ChangeResourceToKnowledgeKind < ActiveRecord::Migration
  def up
    rename_column :knowledges, :resource, :knowledge_kind # table name, old name, new name
  end

  def down
  end
end
