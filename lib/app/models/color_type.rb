class ColorType < ET::EnumType

  TYPE_NAME = 'ColorType'

  class << self;
    class_attribute :type_name
    self.type_name = TYPE_NAME
    ET::EnumType.load_type_items(self.type_name, definer_method = method(:define_method), order=:sequence)
  end

  default_scope { where(type_id: ET::Type.find_by_name(self.type_name).id) }

  def self.to_json(type_name = TYPE_NAME)
    super
  end

end







