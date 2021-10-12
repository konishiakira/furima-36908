class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user, null: false, foreign_key: true      
      t.string :productname,null: false
      t.text :pexplanation,null: false
      t.integer :category_id,null: false
      t.integer :pstatus_id,null: false
      t.integer :shippingcharge_id,null: false
      t.integer :shippingarea_id,null: false
      t.integer :deliverydatedays_id,null: false
      t.integer :price,null: false
      t.timestamps
    end
  end
end