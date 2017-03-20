class Purchase < ApplicationRecord

  has_many :purchase_items, :dependent => :destroy
  accepts_nested_attributes_for :purchase_items, :allow_destroy => true

  belongs_to :supplier

  validates :date, presence: true
  validates :bill_no, presence: true, uniqueness: true
  validates :discount, presence: true

end
