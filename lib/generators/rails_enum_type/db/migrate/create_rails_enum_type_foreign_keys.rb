class CreateRailsEnumTypeForeignKeys< ActiveRecord::Migration
  def change
    add_foreign_key :type_item, :type, on_delete: :cascade, on_update: :cascade
  end
end
