class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :ramen

  validates :body, presence: true
end
