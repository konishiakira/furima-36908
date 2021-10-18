class CreateItemsends < ActiveRecord::Migration[6.0]
  def change
    create_table :itemsends do |t|
      t.string     :postalcode, null: false      
      t.integer    :prefecture_id,null: false
      t.string     :city,null: false
      t.string     :cityaddress,null: false
      t.string     :buildingname,null: false
      t.string     :sendtel,null: false
      t.references :buylog,null: false, foreign_key: true

      t.timestamps
    end
  end
end


# | Column        | Type       | Options                        |
# | ------------- | ---------- | ------------------------------ |
# | postalcode    | string     | null: false                    |
# | prefecture_id | integer    | null: false                    |
# | city          | string     | null: false                    |
# | cityaddress   | string     | null: false                    |
# | buildingname  | string     |                                |
# | sendtel       | string     | null: false                    |
# | buylog        | references | null: false, foreign_key: true |