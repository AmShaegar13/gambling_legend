class RemoveUniqueNameFromUsers < ActiveRecord::Migration
  def change
    remove_index :users, :login
    remove_index :users, :name
    add_index :users, :login
    add_index :users, :name
  end
end
