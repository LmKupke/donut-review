class Api::ReviewsController < ApiController
  before_action :pre_render

  def index
    render json: @reviews
  end

  protected

  def pre_render
    @reviews = Review.all
  end
end
