class CreateRamen < ActiveRecord::Migration
  def change
    create_table :ramen do |t|
      t.string :name, :null => false
      t.string :picture
      t.string :user_name, :null => false
      t.references :shop

      t.timestamps null: false
    end
  end
end
