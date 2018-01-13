class CreateOwners < ActiveRecord::Migration
  def up
    create_table :owners, id: false, primary_key: :owner_name do |t|
      t.string :owner_name, null: false
      t.timestamps null: false
    end
    
  end
  def down
   drop_table :owners
  end
end
