class UsersController < ApplicationController
  def following
  end

  def followers
  end

  def ramen
    user = User.find_by(code: params[:user_code])
    @ramen = user.ramen
    render template: "ramen/index"
  end
end
