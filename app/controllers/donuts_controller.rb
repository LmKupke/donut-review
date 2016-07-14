class DonutsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:query].nil?
      @donuts = Donut.page(params[:page]).per(10)
    else
      @donuts = Donut.global_search(params[:query])
      @donut = Donut.new
    end
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

  def edit
    @donut = Donut.find(params[:id])
  end

  def update
    @donut = Donut.find(params[:id])

    if @donut.update_attributes(new_donut_params)
      flash[:notice] = "Donut successfully updated"
      redirect_to donut_path(@donut)
    else
      render :edit
    end
  end

  def show
    @donut = Donut.find(params[:id])
    @reviews = @donut.reviews.page(params[:page]).per(10)
    # @vendors = Vendor.page(params[:page]).per(10)
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
