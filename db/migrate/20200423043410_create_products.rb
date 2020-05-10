class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.string :description, null: false
      t.integer :status_id, null: false, foreign_key: true
      t.integer :size_id, null: false, foreign_key: true
      t.integer :shippingcost_id, null: false, foreign_key: true
      t.integer :shippingdays_id, null: false, foreign_key: true
      t.integer :prefecture_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id, foreign_key: true
      t.integer :shipping_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.timestamps
    end
  end
end
