class RemoveKindFromKnowledge < ActiveRecord::Migration
  def up
    remove_column :knowledges, :kind # table, column
  end

  def down
  end
end
