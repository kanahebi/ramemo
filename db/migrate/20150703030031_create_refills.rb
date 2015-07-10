class CreateRefills < ActiveRecord::Migration
  def change
    create_table :refills do |t|
      t.string :name, :null => false
      t.references :ramen, :null => false

      t.timestamps null: false
    end
  end
end
