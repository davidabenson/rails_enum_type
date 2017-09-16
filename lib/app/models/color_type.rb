
class ColorType < ET::EnumType
  class << self
    ET::EnumType.load_type_items('Color', definer_method = method(:define_method), :sequence)
  end
end






