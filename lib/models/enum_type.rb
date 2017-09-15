
class EnumType

  def self.load_type_items(type_name, definer_method)
    items = Type.find_by_type_name(type_name)
    items.each do |item|
      type_item = EnumItem.new({id: item.id, name: item.name,
                                       sub_type: item.sub_type, description: item.description,
                                       sequence: item.sequence})

      definer_method.call(type_item.symbol) do
        return type_item
      end
    end
  end


  def self.load_items(items = [], definer_method)
    items.each do |item|
      type_item = EnumItem.new({id: item[:id], name: "#{item[:name]}"})

      definer_method.call(type_item.symbol) do
        return type_item
      end
    end
  end
end
