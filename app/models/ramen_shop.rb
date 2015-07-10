class RamenShop < ActiveRecord::Base
  belongs_to :ramen
  belongs_to :shop
  belongs_to :chain_shop
end
