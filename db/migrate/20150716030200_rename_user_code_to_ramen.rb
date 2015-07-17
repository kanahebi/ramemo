class RenameUserCodeToRamen < ActiveRecord::Migration
  def change
    rename_column :ramen, :user_code, :user_id
  end
end
