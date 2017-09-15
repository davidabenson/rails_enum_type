
class ColorType < EnumType
  class << self
    EnumType.load_type_items('ColorType', definer_method = method(:define_method))
  end
end




