class Unit < ApplicationRecord
  validates :name, presence:true
  validates :print_name, presence:true
end
