class Taste < ActiveRecord::Base
  has_many :ramen_tastes, dependent: :destroy
  has_many :ramen, through: :ramen_tastes
end
