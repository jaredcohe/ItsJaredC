class AddUsernameToUsers < ActiveRecord::Migration
  # rails g migration AddUsernameToUsers
  def up
    add_column :users, :user_name, :text # table name, column name, data type
  end
  
  def down
    remove_column :users, :user_name
  end
end