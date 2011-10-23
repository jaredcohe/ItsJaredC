class ChangeResourceToKnowledgeKind < ActiveRecord::Migration
  def up
    #for heroku
    #add_column :knowledges, :knowledge_kind, :string
    
    #for development
    rename_column :knowledges, :resource, :knowledge_kind # table name, old name, new name
  end

  def down
  end
end
