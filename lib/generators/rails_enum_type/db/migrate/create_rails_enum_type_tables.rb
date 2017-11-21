class CreateRailsEnumTypeTables < ActiveRecord::Migration
  def change
    create_table :type do |t|
      t.string :name, null: false
      t.string :description
    end

    create_table :type_item do |t|
      t.integer :type_id, null: false
      t.string :name, null: false
      t.string :description
      t.decimal :sequence
      t.string :sub_type
      t.string :sub_category
    end
    add_index :type_item, :type_id
  end
end
