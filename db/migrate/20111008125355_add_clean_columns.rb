class AddCleanColumns < ActiveRecord::Migration
  def up
    add_column :knowledges, :clean, :boolean
    add_column :providers, :clean, :boolean
  end

  def down
  end
end
