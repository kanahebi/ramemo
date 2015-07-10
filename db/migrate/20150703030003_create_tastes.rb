class CreateTastes < ActiveRecord::Migration
  def change
    create_table :tastes do |t|
      t.string :name, :null => false
      t.references :ramen, :null => false

      t.timestamps null: false
    end
  end
end
