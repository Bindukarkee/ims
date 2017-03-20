class Sale < ApplicationRecord
  belongs_to :item

  #def item_name
   # item.try(:name)
  #end

  #def item_name=(name)
   # self.item = Item.find_by_name(name) if name.present?
  #end

  has_many :sale_items, :dependent => :destroy
  accepts_nested_attributes_for :sale_items, :allow_destroy => true


end
