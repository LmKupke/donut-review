class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :street_number, :street_name, :city, :state, :zipcode)
  end
end
