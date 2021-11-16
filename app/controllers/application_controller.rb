class ApplicationController < ActionController::Base
  private

  def verified_user
    redirect_to '/' unless user_exists
  end

  def user_exists
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
