class PortalController < ApplicationController
  def index
    if user_signed_in?
      @ramen = Ramen.from_users_followed_by(current_user)
      render template: "ramen/index"
    end
  end
end
