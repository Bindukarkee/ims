class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :unit_id
      t.string :item_code
      t.string :quantity
      t.string :item_group_id
      t.string :description
      t.date :expiry_date

      t.timestamps
    end
  end
end
