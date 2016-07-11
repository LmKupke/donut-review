class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to @vendor, notice: "You have successfully created a new vendor!"
    else
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
