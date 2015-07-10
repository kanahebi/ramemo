class RamenTaste < ActiveRecord::Base
  belongs_to :ramen
  belongs_to :taste
end
