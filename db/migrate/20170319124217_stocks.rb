class Stocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :item_id, :integer
    add_column :stocks, :quantity, :integer
    add_column :stocks, :est_sell_price, :integer
  end
end
