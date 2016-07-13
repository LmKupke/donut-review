class VendorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @vendors = Vendor.page(params[:page]).per(10)
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.user = current_user
    if @vendor.save
      redirect_to @vendor, notice: "You have successfully created a new vendor!"
    else
      flash[:alert] = 'Please try again!'
      render :new
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :street_number, :street_name, :city, :state, :zipcode)
  end
end
