module ET
  class EnumType < ET::TypeItem

    class << self;
      class_attribute :type_name

    end

    def self.load_type_items(type_name, definer_method, order=:name)
      @type_name = type_name
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

    def self.to_json()
      a = []
      puts "@type_name: #{EnumType.type_name}"
      items = Model::Type.find_by_type_name(EnumType.type_name)
      puts items
      items.each do |enum_type|
        a << {id: enum_type.id, name: enum_type.name}
      end

      return a.to_json.html_safe
    end

  end

end
