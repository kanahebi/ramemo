class User < ActiveRecord::Base
  has_many :ramen, class_name: "Ramen", dependent: :destroy#, foreign_key: :user_code, primary_key: :code
  has_many :likes, dependent: :destroy

  has_many :follower_relation, foreign_key: "follower_id", class_name: "Follow", dependent: :destroy
  has_many :followed_users, through: :follower_relation, source: :followed

  has_many :followed_relation, foreign_key: "followed_id", class_name: "Follow", dependent: :destroy
  has_many :followers, through: :followed_relation, source: :follower

  validates :code, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  def self.from_omniauth(auth)
    # providerとuidでUserレコードを取得する
    # 存在しない場合は、ブロック内のコードを実行して作成する
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # auth.provider には "twitter"、
      # auth.uidには twitterアカウントに基づいた個別のIDが入っている
      # first_or_createメソッドが自動でproviderとuidを設定してくれるので、
      # ここでは設定は必要ない
      user.code = auth.info.nickname # twitterで利用している名前が入る
      user.name = auth.info.name # twitterで利用している名前が入る
      user.email = auth.info.email # twitterの場合入らない
      Rails.logger.info auth.info.inspect
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def email_required?
    (!provider || !email.blank?) && super
  end

  def password_required?
    super && provider.blank?
  end

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
