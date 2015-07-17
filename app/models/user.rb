class User < ActiveRecord::Base
  has_many :ramen, class_name: "Ramen", dependent: :destroy#, foreign_key: :user_code, primary_key: :code

  has_many :follower_relation, foreign_key: "follower_id", class_name: "Follow", dependent: :destroy
  has_many :followed_users, through: :follower_relation, source: :followed

  has_many :followed_relation, foreign_key: "followed_id", class_name: "Follow", dependent: :destroy
  has_many :followers, through: :followed_relation, source: :follower

  validates :code, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def following?(other_user)
    follower_relation.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follower_relation.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follower_relation.find_by(followed_id: other_user.id).destroy
  end
end
