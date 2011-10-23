class RenameIdColumns < ActiveRecord::Migration
  def up
    rename_column :knowledges, :knowledge_string_id, :string_id # table name, old name, new name
    rename_column :providers, :provider_string_id, :string_id # table name, old name, new name
  end

  def down
  end
end
