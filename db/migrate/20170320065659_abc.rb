class Abc < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :total, :integer
  end
end
