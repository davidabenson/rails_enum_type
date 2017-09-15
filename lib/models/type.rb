class Type < ActiveRecord::Base
  self.table_name = "type"
  has_many :type_items
  
  accepts_nested_attributes_for :type_items, :reject_if => :all_blank, :allow_destroy => true
  
  # VALIDATION
  validates :name, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  
  def self.find_by_type_name(type_name)
    this.Type.find_by_name(type_name).type_items
  end

  def self.find_type_item_by_name(key, name)
    items = Type.find_by_name(key).type_items.select { |i| i.name == name }
    items.try(:first)
  end
  
  def self.reorder_by_name(type_name)
     items = Type.find_by_name(type_name).type_items.order(:name)
     idx = 1
     items.each do |gti|
       gti.sequence = idx
       gti.save
       idx += 1
     end
  end
end


