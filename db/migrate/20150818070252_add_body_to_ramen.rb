class AddBodyToRamen < ActiveRecord::Migration
  def change
    add_column :ramen, :body, :text
  end
end
