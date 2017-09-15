class TypeItem < ActiveRecord::Base
  self.table_name = "type_item"
  belongs_to :type
  
  # VALIDATION
  validates :name, length: { maximum: 255 }
end
