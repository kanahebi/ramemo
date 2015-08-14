class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :ramen, :null => false
      t.references :user, :null => false

      t.timestamps null: false
    end
  end
end
