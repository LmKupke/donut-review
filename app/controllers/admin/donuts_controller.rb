class Admin::DonutsController < ApplicationController
  before_action :authorize_user

  def destroy
    donut_id = params[:id]
    @donut = Donut.find(donut_id)
    if !@donut.nil?
      @donut.destroy
      redirect_to admin_users_path,
        notice: "You have successfully deleted a donut and their reviews."
    else
      redirect_to admin_users_path,
        notice: "Hmm that donut must have been deleted before or doesn't exist."
    end
  end

  protected

  def authorize_user
    unless current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
