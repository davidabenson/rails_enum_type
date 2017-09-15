
class EnumItem
  attr_accessor :name, :id, :sub_type, :description, :sequence, :symbol

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @description = attributes[:description]
    @sub_type = attributes[:sub_type]
    @sequence = attributes[:sequence]
    @symbol = attributes[:name].parameterize.underscore
  end
end
