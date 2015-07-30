class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :ramen, :null => false
      t.references :user, :null => false
      t.text :body

      t.timestamps null: false
    end
  end
end
