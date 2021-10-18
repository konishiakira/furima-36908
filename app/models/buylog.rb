class Buylog < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :itemsend
end
