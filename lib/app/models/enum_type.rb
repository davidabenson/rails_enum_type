module ET
  class EnumType
    class << self; class_attribute :item_list end

    def self.load_type_items(type_name, definer_method, order=:name)
      item_list = []
      items = ET::Type.find_by_type_name(type_name).order(order)
      items.each do |item|
        type_item = ET::EnumItem.new({id: item.id, name: "#{item.name}", sub_type: item.sub_type, sub_category: item.sub_category})

        definer_method.call(type_item.symbol) do
          return type_item
        end

        item_list << type_item
      end
      item_list
    end

    def item_list
      self.class.item_list
    end

    def self.all
      return @item_list
    end

    def self.to_json()
      a = []
      @item_list.each_with_object({}) do |enum_type|
        a << {id: enum_type.id, name: enum_type.name}
      end

      return a.to_json.html_safe
    end

  end
end
