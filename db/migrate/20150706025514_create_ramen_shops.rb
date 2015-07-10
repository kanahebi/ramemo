class CreateRamenShops < ActiveRecord::Migration
  def change
    create_table :ramen_shops do |t|
      t.references :ramen
      t.references :shop
      t.references :chain_shop

      t.timestamps null: false
    end
  end
end
