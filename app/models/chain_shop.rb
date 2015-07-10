class ChainShop < ActiveRecord::Base
  has_many :ramen_shops, dependent: :destroy
  belongs_to :shop
  has_many :ramen, through: :ramen_shops
end
