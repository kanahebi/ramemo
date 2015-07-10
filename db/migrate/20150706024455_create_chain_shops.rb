class CreateChainShops < ActiveRecord::Migration
  def change
    create_table :chain_shops do |t|
      t.string :name
      t.references :shop

      t.timestamps null: false
    end
  end
end
