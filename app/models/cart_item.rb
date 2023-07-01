class CartItem < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :customer

  validates :amount, presence: true
  validates :item_id, presence: true
  validates :customer_id, presence: true

  def with_tax_price
    (item.price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

end
