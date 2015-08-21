class ChangeUserCodeToRamen < ActiveRecord::Migration
  def up
    change_column :ramen, :user_code, 'integer USING CAST(user_code AS integer)', null: false
  end

  def down
    change_column :ramen, :user_code, :string, null: false
  end
end
