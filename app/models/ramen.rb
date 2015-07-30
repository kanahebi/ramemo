class Ramen < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  belongs_to :user#, class_name: "User"#, foreign_key: :user_code, primary_key: :code

  has_one :ramen_shop, dependent: :destroy
  has_one :shop, through: :ramen_shop
  accepts_nested_attributes_for :ramen_shop, reject_if: :all_blank
  has_one :chain_shop, through: :ramen_shop

  has_many :comments, dependent: :destroy

  has_many :ramen_tastes, dependent: :destroy
  has_many :tastes, through: :ramen_tastes
  accepts_nested_attributes_for :ramen_tastes, reject_if: :all_blank

  validates :name, presence: true
  validates :user_id, presence: true

  default_scope -> { order('created_at DESC') }
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM follows
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
