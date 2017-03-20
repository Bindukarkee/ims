class AddingFiscalYear < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :fiscal_year, :date
  end
end
