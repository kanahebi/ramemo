class RenameUserNameToRamen < ActiveRecord::Migration
  def up
    rename_column :ramen, :user_name, :user_code
  end

  def down
    rename_column :ramen, :user_code, :user_name
  end
end
