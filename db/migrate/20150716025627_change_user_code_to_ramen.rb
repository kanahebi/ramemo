class ChangeUserCodeToRamen < ActiveRecord::Migration
  def up
    change_column :ramen, :user_code, :integer, null: false
  end

  def down
    change_column :ramen, :user_code, :string, null: false
  end
end
