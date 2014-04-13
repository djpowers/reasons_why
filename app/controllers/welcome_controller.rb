class WelcomeController < ApplicationController

  def index
    @lists = List.where(user_id: current_user.id) if user_signed_in?
  end

end
