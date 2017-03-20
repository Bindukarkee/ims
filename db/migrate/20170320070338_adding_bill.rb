class AddingBill < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :bill_no, :integer
  end
end
