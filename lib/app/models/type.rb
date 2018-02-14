module ET
  class Type < ActiveRecord::Base
    has_many :type_items

    accepts_nested_attributes_for :type_items, :reject_if => :all_blank, :allow_destroy => true

    # VALIDATION
    validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
    validates :description, length: { maximum: 255 }

    def self.find_by_type_name(type_name)
      ET::Type.find_by_name(type_name).type_items
    end

  end
end



