class RemoveShopFromRamens < ActiveRecord::Migration
  def change
    remove_column :ramen, :shop_id
  end
end
