class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_layout_data

  def set_layout_data
    @user = current_user
    @user_signed_in = user_signed_in?
  end
end
