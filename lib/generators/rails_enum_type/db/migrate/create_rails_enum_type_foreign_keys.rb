class CreateRailsEnumTypeForeignKeys< ActiveRecord::Migration[4.2]
  def change
    add_foreign_key :type_item, :type, on_delete: :cascade, on_update: :cascade
  end
end
