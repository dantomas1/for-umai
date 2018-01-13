class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :name
      t.string :price
      t.text :description
      t.string :owner_name
      t.timestamps null: false
    end
  end
  def down
    drop_table :articles
  end
end
