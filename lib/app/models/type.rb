module ET
  class Type < ActiveRecord::Base
    self.table_name = "type"
    has_many :type_items

    accepts_nested_attributes_for :type_items, :reject_if => :all_blank, :allow_destroy => true

    # VALIDATION
    validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
    validates :description, length: { maximum: 255 }

    def self.find_type_items_by_name(type_name, order=:name)
      find_by_name(type_name).type_items.order(order)
    end

    def self.find_type_item_by_name(key, name)
      items = find_by_name(key).type_items.select { |i| i.name == name }
      items.try(:first)
    end
  end
end



