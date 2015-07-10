class User < ActiveRecord::Base
  has_many :ramen, class_name: "Ramen", foreign_key: :user_code, primary_key: :code, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
