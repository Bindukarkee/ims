class ItemGroup < ApplicationRecord
  has_many :items
  has_many :item_groups
end
