class CreateRailsEnumTypeTables < ActiveRecord::Migration[4.2]
  def change
    create_table :type do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps null: false
    end

    create_table :type_item do |t|
      t.integer :type_id, null: false
      t.string :name, null: false
      t.string :description
      t.decimal :sequence
      t.string :sub_type
      t.string :sub_category

      t.timestamps null: false
    end
    add_index :type_item, :type_id
  end
end
