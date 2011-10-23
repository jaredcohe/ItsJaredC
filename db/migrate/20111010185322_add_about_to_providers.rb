class AddAboutToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :about, :string
  end
end
