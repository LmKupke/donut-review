class DonutsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @donuts = Donut.all
  end

  def new
    @donut = Donut.new
  end

  def show
    @donut = Donut.find(params[:id])
  end
end
