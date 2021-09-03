class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_info
      t.integer :item_category_id
      t.integer :item_sales_status_id
      t.integer :item_shipping_fee_status_id
      t.integer :item_prefecture_id
      t.integer :item_scheduled_delivery_id
      t.integer :item_price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
