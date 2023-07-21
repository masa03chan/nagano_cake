class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: { cannot_make: 0, waiting_for_making: 1, in_the_making: 2, completed: 3 }

  validates :price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true

end
