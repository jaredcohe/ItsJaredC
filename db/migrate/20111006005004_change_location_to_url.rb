class ChangeLocationToUrl < ActiveRecord::Migration
  def up
    rename_column :providers, :location, :url # table name, old name, new name
  end

  def down
  end
end