
class ColorType < EnumType
  class << self
    EnumType.load_type_items('Color', definer_method = method(:define_method), :sequence)
  end
end




