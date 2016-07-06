class DonutsController < ApplicationController
  def index
    @donuts = Donut.all
  end

  def new
    @donut = Donut.new
  end

  def create
  end

  def show
    @donut = Donut.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
