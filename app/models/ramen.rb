class Ramen < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  belongs_to :user, class_name: "User", foreign_key: :user_code, primary_key: :code

  has_one :ramen_shop, dependent: :destroy
  has_one :shop, through: :ramen_shop
  accepts_nested_attributes_for :ramen_shop, reject_if: :all_blank
  has_one :chain_shop, through: :ramen_shop

  has_many :ramen_tastes, dependent: :destroy
  has_many :tastes, through: :ramen_tastes
  accepts_nested_attributes_for :ramen_tastes, reject_if: :all_blank

  validates :name, presence: true
  validates :user_code, presence: true
end
