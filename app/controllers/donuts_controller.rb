class DonutsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:query].nil?
      @donuts = Donut.page(params[:page]).per(12)
    else
      @donuts = Donut.global_search(params[:query])
      @donut = Donut.new
    end
  end

  def new
    @vendor = Vendor.new
    @donut = Donut.new
  end

  def create
    if !new_vendor_params["name"].empty?
      @vendor = Vendor.new(new_vendor_params)
      @vendor.user = current_user
      if @vendor.save
        @donut = Donut.new(new_donut_params)
        @donut.user = current_user
        @donut.vendor = @vendor
        donut_valid?(@donut)
      else
        render :new
      end
    else
      @donut = Donut.new(new_donut_params)
      @donut.user = current_user
      donut_valid?(@donut)
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
    @vendor = @donut.vendor
    @reviews = @donut.reviews.page(params[:page]).per(10)
    @review = Review.new
    total_reviews = @donut.reviews
    review_number = total_reviews.length
    if review_number == 0
      @average = "No"
    else
      @average = 0
      total_reviews.each do |review|
        @average += review.rating.to_f
      end
      @average /= review_number
      @average = @average.round(2)
    end
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

  def new_vendor_params
    params.require(:vendor).permit(
      :name,
      :street_number,
      :street_name,
      :city,
      :state,
      :zipcode
    )
  end

  def donut_valid?(donut)
    if donut.save
      redirect_to donut_path(donut),
      notice: "You have successfully added a new donut!"
    else
      render :new
    end
  end
end
