class Admin::UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
    @donuts = Donut.all
  end

  def destroy
    user_id = params[:id]
    @user = User.find(user_id)
    if !@user.nil?
      @user.destroy
      redirect_to admin_users_path,
        notice: "You have successfully deleted a user"
    else
      redirect_to admin_users_path, notice: "Hmm something went wrong"
    end
  end

  protected

  def authorize_user
    unless current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
