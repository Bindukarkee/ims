class Item < ApplicationRecord
 belongs_to :item_group

 belongs_to :unit

 has_many :sales

 belongs_to :fiscal_year

 has_many :purchase_items

  has_one :stock, inverse_of: :item,
  dependent: :destroy

 accepts_nested_attributes_for :stock

  validates :name, presence:true
  validates :unit_id, presence:true
  validates :item_code, presence:true
  validates :item_group_id, presence:true
  validates :description, presence:true

end
