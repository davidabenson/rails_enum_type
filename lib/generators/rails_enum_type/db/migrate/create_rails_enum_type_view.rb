class CreateRailsEnumTypeView < ActiveRecord::Migration
  sql=<<-SQL_CODE
      create or replace view type_item_view as
        SELECT 
        t.id as type_id,
        t.name AS type,
        ti.id AS type_item_id,
        ti.name AS type_item,
        ti.description,
        ti.sequence
   FROM type t, type_item ti
  WHERE ti.type_id = t.id
  ORDER BY ti.sequence;
  SQL_CODE
  #RailsMigrationPlus::create_view('type_item_view', sql)

  execute sql

  type = ET::Type.new(name: 'ColorType')
  red_item = ET::TypeItem.new(name: 'Red', sequence: 1)
  green_item = ET::TypeItem.new(name: 'Green', sequence: 2)
  blue_item = ET::TypeItem.new(name: 'Blue', sequence: 3)

  type.type_items << red_item
  type.type_items << green_item
  type.type_items << blue_item

  type.save

end