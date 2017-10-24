module ET
  class EnumType
    @@items = []
    def self.load_type_items(type_name, definer_method, order=:name)
      if !@@items.empty?
        return
      end

      type_items = Type.find_type_items_by_name(type_name, order)
      type_items.each do |item|
        type_item = EnumItem.new({id: item.id, name: item.name,
                                         sub_type: item.sub_type, description: item.description,
                                         sequence: item.sequence})

        definer_method.call(type_item.symbol) do
          return type_item
        end
        @@items << type_item
      end
    end

    def self.items
      return @@items
    end
    
    def self.all
      return @@items
    end

  end
end
