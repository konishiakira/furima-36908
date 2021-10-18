FactoryBot.define do
  factory :buylog_itemsend do
    # price {3000}   //配送先時にやる必要ない 
    postalcode {"123-4567"}
    prefecture_id {3}
    city {"葛飾区"}
    cityaddress {"1-23-4"}
    buildingname {"小嶋ランド"}
    sendtel {"09099998888"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
