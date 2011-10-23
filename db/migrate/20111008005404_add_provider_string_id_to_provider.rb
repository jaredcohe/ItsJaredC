class AddProviderStringIdToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :provider_string_id, :string #table name, column name, data type
  end
end
