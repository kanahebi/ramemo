class RemoveRamenFromTastes < ActiveRecord::Migration
  def change
    remove_column :tastes, :ramen_id
  end
end
