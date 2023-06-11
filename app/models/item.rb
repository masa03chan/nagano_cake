class Item < ApplicationRecord
  has_one_attached :image
  
  belongs_to :genres
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  
  
  
end
