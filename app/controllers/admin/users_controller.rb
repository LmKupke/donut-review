class Admin::UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
    @donuts = Donut.all
  end

  protected

  def authorize_user
    if !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
