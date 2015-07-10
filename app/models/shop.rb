class Shop < ActiveRecord::Base
  has_many :ramen_shops, dependent: :destroy
  has_many :chain_shops, dependent: :destroy
  has_many :ramen, through: :ramen_shops
end
