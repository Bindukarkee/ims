class Items < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :fiscal_year_id, :string
  end
end
