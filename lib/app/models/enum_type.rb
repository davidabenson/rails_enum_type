module ET
  class EnumType < ET::TypeItem

    def self.load_type_items(type_name, definer_method, order=:name)
      puts "!!!!!ET::TypeItem:load_type_items: here"
      items = ET::Type.find_by_type_name(type_name).order(order)
      items.each do |item|
        definer_method.call(item.name.parameterize.underscore) do
          return item
        end
      end
    end

    # def self.typed_load_type_items(items, type_name, definer_method, order=:name)
    #   puts "!!!!!ET::TypeItem:typed_load_type_items: here"
    #   items.each do |item|
    #     definer_method.call(item.name.parameterize.underscore) do
    #       return item
    #     end
    #   end
    # end

    def symbol
      self.name.parameterize.underscore
    end

    def self.to_json(type_name)
      a = []
      items = Model::Type.find_by_type_name(type_name)
      puts items
      items.each do |enum_type|
        a << {id: enum_type.id, name: enum_type.name}
      end

      return a.to_json.html_safe
    end

  end

end
