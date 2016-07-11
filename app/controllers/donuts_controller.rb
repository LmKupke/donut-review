class DonutsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @donuts = Donut.all
  end

  def new
    @donut = Donut.new
  end

  def create
    @donut = Donut.new(new_donut_params)
    @donut.user = current_user
    if @donut.save
      redirect_to @donut, notice: "You have successfully added a new donut!"
    else
      render :new
    end
  end

  def show
    @donut = Donut.find(params[:id])
    @reviews = @donut.reviews
    @review = Review.new
  end

  def destroy
    @donut = Donut.find(params[:id])
    @donut.destroy
    redirect_to root_path
  end

  protected

  def new_donut_params
    params.require(:donut).permit(
      :name,
      :vendor_id,
      :image,
      :description,
    )
  end
end
