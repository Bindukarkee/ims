class Sales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :item_name, :string
  end
end
