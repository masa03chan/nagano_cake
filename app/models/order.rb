class Order < ApplicationRecord
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_the_making: 2, shipping_preparation: 3, completed: 4 }

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
