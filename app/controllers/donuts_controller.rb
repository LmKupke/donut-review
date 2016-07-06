class DonutsController < ApplicationController
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
