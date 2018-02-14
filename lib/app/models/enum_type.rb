module ET
  class EnumType < ET::TypeItem

    def self.load_type_items(type_name, definer_method, order=:name)
      items = ET::Type.find_by_type_name(type_name).order(order)
      items.each do |item|

        definer_method.call(item.name.parameterize.underscore) do
          return item
        end
      end
    end

    def symbol
      self.name.parameterize.underscore
    end

  end

end
