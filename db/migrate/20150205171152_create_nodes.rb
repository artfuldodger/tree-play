class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :parent
      t.string :name
      t.integer :position
      t.integer :level

      t.timestamps
    end
    add_index :nodes, :parent_id
  end
end
