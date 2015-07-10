class RenameNameToUsers < ActiveRecord::Migration
  def up
    rename_column :users, :name, :code
  end

  def down
    rename_column :users, :code, :name
  end
end
