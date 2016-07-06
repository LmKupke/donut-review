class DonutsController < ApplicationController
  def index
    @donuts = Donut.all
  end

  def new
    @donut = Donut.new
  end

  def create
    @donut = Donut.new(new_donut_params)
    if @donut.save
      redirect_to @donut, notice: "You have successfully added a new donut!"
    else
      render :new
    end
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

  protected

  def new_donut_params
    params.require(:donut).permit(:name, :vendor_name, :image, :description, :user_id)
  end
end
