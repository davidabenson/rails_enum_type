
class ColorType < ET::EnumType
  class << self
    ColorType.item_list = ColorType.item_list = ET::EnumType.load_type_items('Color', definer_method = method(:define_method), :sequence)
  end
end






