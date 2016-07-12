class Admin::UsersController < ApplicationController

  def index
    @users = User.all
    @donuts = Donut.all
  end
end
