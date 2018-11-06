module ET
  class TypeItem < ActiveRecord::Base
    self.table_name = "type_item"
    belongs_to :type

    # VALIDATION
    validates :name, presence: true, length: { maximum: 255 }
    #validates :description, length: { maximum: 255 }
  end
end
