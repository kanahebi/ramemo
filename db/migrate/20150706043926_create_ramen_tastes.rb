class CreateRamenTastes < ActiveRecord::Migration
  def change
    create_table :ramen_tastes do |t|
      t.references :ramen
      t.references :taste

      t.timestamps null: false
    end
  end
end
