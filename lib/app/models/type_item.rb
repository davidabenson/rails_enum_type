module ET
  class TypeItem < ActiveRecord::Base
    belongs_to :type

    # VALIDATION
    validates :name, presence: true, length: { maximum: 255 }
    #validates :description, length: { maximum: 255 }
  end
end
