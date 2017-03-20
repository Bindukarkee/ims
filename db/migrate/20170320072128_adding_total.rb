class AddingTotal < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :discount, :integer
  end
end
