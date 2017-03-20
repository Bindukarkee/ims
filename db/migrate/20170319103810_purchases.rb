class Purchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :date, :date
    add_column :purchases, :date, :date
    change_column :stocks, :unit_price, :integer
  end
end
