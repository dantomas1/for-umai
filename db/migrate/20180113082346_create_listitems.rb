class CreateListitems < ActiveRecord::Migration
  def up
    create_table :listitems do |t|
      t.string :title
      t.text :description
      t.integer :list_id
      t.integer :tag_id
      t.string :state, default: "active"
      t.timestamps null: false
    end
  end
  def down
    drop_table :listitems
  end
end
