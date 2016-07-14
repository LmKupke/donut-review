class Api::DonutsController < ApiController
  before_action :pre_render

  def index
    render json: @donuts
  end

  protected

  def pre_render
    @donuts = Donut.page(params[:page]).per(10)
  end
end
